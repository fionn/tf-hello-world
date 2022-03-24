terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.6.0"
    }
  }
  required_version = ">= 1"
}

provider "aws" {
  region = var.aws_region
}
