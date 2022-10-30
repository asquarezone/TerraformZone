terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# configure aws provider that depends on credentials in
# HOME-DIR/.aws/credentials
provider "aws" {
    region = "us-west-2"
    alias = "primary"
}

provider "aws" {
    region = "us-west-1"
    alias = "secondary"
}