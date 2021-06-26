# Digital Ocean Reverse Shell

## Overview

This terraform code accompanies this post on my blog about spinning up a [Reverse Shell in the DigitalOcean with Terraform](https://ronamosa.io/documentation/2021-06-25-Reverse-Shell-Digital-Ocean/).

## Get Started

The `tl;dr` if you just want to fire this up right away

```sh
git clone https://github.com/ronamosa/do-reverse-shell
cd do-reverse-shell/
```

set environment variables

```sh
export TF_VAR_do_token=<paste your DigitalOcean API key here>
export TF_VAR_ssh_fingerprint=<paste your ssh fingerprint here>
```

terraform go!

```sh
terraform init
terraform apply
```

## Cleanup

```sh
terraform destroy
```
