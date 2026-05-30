terraform {
  required_version = ">= 1.10.0, < 2.0.0"

  backend "s3" {
  bucket       = "myapp-terraform-state-arovm"
  key          = "myapp/dev/terraform.tfstate"
  region       = "us-east-1"
  use_lockfile = true
  encrypt      = true
}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
}
