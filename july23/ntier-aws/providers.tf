terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.10.0"
    }
  }
  required_version = ">= 1.4.0"
  backend "s3" {
    bucket = "qtcommonstate"
    key ="ntier-aws/terraform"
    region = "ap-south-1"
    dynamodb_table = "qtterraformstate"
  }
}

provider "aws" {
  region = "us-west-1"
}