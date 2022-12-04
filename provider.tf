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
  access_key = "AKIAUZDPJYPRIH3N3M73"
  secret_key = "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"
}
