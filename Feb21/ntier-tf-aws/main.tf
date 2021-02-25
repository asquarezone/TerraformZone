provider "aws" {
  region = "us-west-2"
}

# we need to create a vpc resource
resource "aws_vpc" "ntiervpc" {
    cidr_block = "192.168.0.0/16"

    tags = {
      "Name" = "from tf"
    }
  
}