terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "ntiervpc" {
    cidr_block = "10.10.0.0/16"

    tags = {
      "Name" = "ntier"
    }
  
}