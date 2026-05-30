terraform {
  required_version = ">= 1.6.0, < 2.0.0"

  backend "s3" {
    bucket         = "myapp-terraform-state-arovm"
    key            = "myapp/staging/terraform.tfstate"
    region         = "us-east-1"
    profile        = "arovm"
    dynamodb_table = "myapp-terraform-locks"
    encrypt        = true
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
  profile = "arovm"
  region  = var.aws_region
}
