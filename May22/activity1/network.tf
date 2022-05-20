# lets try to define the resource for the vpc
resource "aws_vpc" "myvpc" {
    cidr_block  = "192.168.0.0/16"

    tags        = {
      "Name"    = "from-tf"
    }
  
}

# lets create web1 subnet
resource "aws_subnet" "web1" {
    vpc_id              = aws_vpc.myvpc.id
    cidr_block          = "192.168.0.0/24"
    availability_zone   = "ap-south-1a"

    tags                = {
      "Name"            = "web1-tf"
    }
  
}

# lets create web2 subnet
resource "aws_subnet" "web2" {
    vpc_id              = aws_vpc.myvpc.id
    cidr_block          = "192.168.1.0/24"
    availability_zone   = "ap-south-1b"

    tags                = {
      "Name"            = "web2-tf"
    }
  
}

# lets create db1 subnet
resource "aws_subnet" "db1" {
    vpc_id              = aws_vpc.myvpc.id
    cidr_block          = "192.168.2.0/24"
    availability_zone   = "ap-south-1a"

    tags                = {
      "Name"            = "db1-tf"
    }
  
}

# lets create db2 subnet
resource "aws_subnet" "db2" {
    vpc_id              = aws_vpc.myvpc.id
    cidr_block          = "192.168.3.0/24"
    availability_zone   = "ap-south-1b"

    tags                = {
      "Name"            = "db2-tf"
    }
  
}