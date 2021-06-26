# Output Public IP
output "public_ipv4_address" {
  value = digitalocean_droplet.shell.ipv4_address
}