# Lets configure the Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "myfirstbucket" {
    bucket = "qts3fromterraform1"
    acl    = "public-read"
  
}