provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "first" {
  cidr_block = "10.10.0.0/16"
}