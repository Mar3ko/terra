terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIA5H62JAYT4VYFS3US"
  secret_key = "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"
}