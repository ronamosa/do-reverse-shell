terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

# Droplet
resource "digitalocean_droplet" "shell" {
  image              = var.droplet_image
  name               = "reverse-shell"
  region             = var.droplet_region
  size               = var.droplet_size
  private_networking = true
  ssh_keys = [
    var.ssh_fingerprint
  ]
}

# Firewall
resource "digitalocean_firewall" "shell" {
  name = "allow-ssh-reverse-port"

  droplet_ids = [digitalocean_droplet.shell.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "6666"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
