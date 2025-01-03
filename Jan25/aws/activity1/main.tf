terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


resource "aws_vpc" "network" {
  cidr_block = "10.100.0.0/16"
  tags = {
    Name = "from tf"
  }

}

resource "aws_subnet" "web1" {
  vpc_id            = aws_vpc.network.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.100.0.0/24"
  tags = {
    Name = "web-1"
  }
  depends_on = [aws_vpc.network]

}

resource "aws_subnet" "web2" {
  vpc_id            = aws_vpc.network.id
  cidr_block        = "10.100.1.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "web-2"
  }
  depends_on = [aws_vpc.network]

}

resource "aws_subnet" "db1" {
  vpc_id            = aws_vpc.network.id
  availability_zone = "ap-south-1a"
  cidr_block        = "10.100.2.0/24"
  tags = {
    Name = "db-1"
  }
  depends_on = [aws_vpc.network]

}

resource "aws_subnet" "db2" {
  vpc_id            = aws_vpc.network.id
  cidr_block        = "10.100.3.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "db-2"
  }
  depends_on = [aws_vpc.network]

}