# VPC Section
resource "aws_vpc" "myvpc" {
    cidr_block              = var.vpc_cidr
    enable_dns_support      = true
    tags = {
        Name = var.vpctag
    }
}

# Web Subnet
resource "aws_subnet" "web" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = cidrsubnet(var.vpc_cidr,8,0)
    availability_zone       = format("%s%s",var.region,var.availabilty_zones[0])

    tags = {
        Name = var.subnet_tags[0]
    }

}

resource "aws_subnet" "app" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = cidrsubnet(var.vpc_cidr,8,1)
    availability_zone       = format("%s%s",var.region,var.availabilty_zones[1])

    tags = {
        Name = var.subnet_tags[1]
    }

}

resource "aws_subnet" "db" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = cidrsubnet(var.vpc_cidr,8,2)
    availability_zone       = format("%s%s",var.region,var.availabilty_zones[2])

    tags = {
        Name = var.subnet_tags[2]
    }

}

resource "aws_subnet" "mgmt" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = cidrsubnet(var.vpc_cidr,8,3)
    availability_zone       = format("%s%s",var.region,var.availabilty_zones[3])

    tags = {
        Name = var.subnet_tags[3]
    }

}