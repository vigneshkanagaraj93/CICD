terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = "AKIAUZDPJYPREJTRDVP7"
  secret_key = "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"
}