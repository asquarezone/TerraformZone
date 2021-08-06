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
# aws_vpc.ntiervpc.id

# depends on AWS VPC
# web subnet
resource "aws_subnet" "websubnet" {

    cidr_block = "10.10.0.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      "Name" = "ntier-web"
    }
    vpc_id = aws_vpc.ntiervpc.id
  
}

resource "aws_subnet" "appsubnet" {
    cidr_block = "10.10.1.0/24"
    availability_zone = "ap-south-1a"
    tags = {
      "Name" = "ntier-app"
    }
    vpc_id = aws_vpc.ntiervpc.id
  
}

resource "aws_subnet" "dbsubnet" {
  cidr_block = "10.10.2.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    "Name" = "ntier-db"
  }
  vpc_id = aws_vpc.ntiervpc.id
  
}
