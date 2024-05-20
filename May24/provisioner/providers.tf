terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }
  backend "s3" {
    bucket = "terraformbackendqt"
    key = "learning/provisioners"
    region = "ap-south-1"
    dynamodb_table = "forlocking"
    
  }
}

provider "aws" {
  region = var.primary_region
}