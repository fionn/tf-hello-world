# Terraform Hello World

## Overview

This is supposed to be a gentle introduction to Terraform.

The "hello world" of Terraform is creating a server.
Since we're an AWS shop, we'll use it to spin up an EC2 instance.

## SSH Keys

We'll connect to the server over SSH using our SSH key.

If you don't already have an Ed25519 keypair, generate one with with
```bash
ssh-keygen -t ed25519
```
which will be saved to `~/.ssh/id_ed25519` and `~/.ssh/id_ed25519.pub` by default.

## Terraform

The Terraform code is in the [`infrastructure/`](infrastructure/) directory.

From that directory, run:
* `terraform init` (the first time only),
* `terraform validate` (optional),
* `terraform plan` (optional),
* `terraform apply`,

to create the infrastructure defined by it.

## Not Covered

* How to get AMI IDs using Terraform.
* Using a non-default VPC.
* Managing state.
* Provisioning instances.
