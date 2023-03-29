terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.60.0"
    }
  }
  required_version = "> 1.0.0"
}

provider "aws" {
  # Configuration options
}