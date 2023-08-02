terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.10.0"
    }
  }
  required_version = ">= 1.4.0"
}

provider "aws" {
  region = "us-west-1"
}