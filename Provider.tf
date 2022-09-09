terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.23.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
}