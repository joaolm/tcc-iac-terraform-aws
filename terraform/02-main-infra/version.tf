terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "tcc-iac-tfstate-2025-jlm-mrf"
    key            = "main-infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tcc-iac-tf-locks"
    encrypt        = true
  }
}

provider "aws" {
  region  = var.aws_region
}