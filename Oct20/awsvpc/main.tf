# VPC Section
resource "aws_vpc" "myvpc" {
    cidr_block              = var.vpc_cidr
    enable_dns_support      = true
    tags = {
        Name = "fromtf"
    }
}

# Web Subnet
resource "aws_subnet" "web" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = cidrsubnet(var.vpc_cidr,8,0)
    availability_zone       = "us-west-2a"

    tags = {
        Name = "web"
    }

}

resource "aws_subnet" "app" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = cidrsubnet(var.vpc_cidr,8,1)
    availability_zone       = "us-west-2b"

    tags = {
        Name = "app"
    }

}

resource "aws_subnet" "db" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = cidrsubnet(var.vpc_cidr,8,2)
    availability_zone       = "us-west-2c"

    tags = {
        Name = "db"
    }

}

resource "aws_subnet" "mgmt" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = cidrsubnet(var.vpc_cidr,8,3)
    availability_zone       = "us-west-2a"

    tags = {
        Name = "mgmt"
    }

}