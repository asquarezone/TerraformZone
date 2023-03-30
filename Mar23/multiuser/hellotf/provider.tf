terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60.0"
    }
  }
  required_version = "> 1.0.0"
  backend "s3" {
    bucket         = "terraformremotebackendqt"
    key            = "classes/hellotf"
    dynamodb_table = "terraformlock"
    region         = "us-west-2"

  }
}

provider "aws" {
  # Configuration options
  region = var.region
}