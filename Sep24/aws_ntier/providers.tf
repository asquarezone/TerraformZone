terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~= 5.64.9"
    }
  }
  required_version = ">= 1.9.0"
}

provider "aws" {
  # Configuration options
}