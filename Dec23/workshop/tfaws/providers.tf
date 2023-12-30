terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "qtdectfstate"
    key            = "examples/workshop"
    region         = "us-west-2"
    dynamodb_table = "qtterraformstate"

  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
}