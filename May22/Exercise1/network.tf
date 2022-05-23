resource "aws_vpc" "ntier" {
    cidr_block      = var.network_cidr
    tags            = {
        Name        = "ntier"
    } 
}


resource "aws_subnet" "web1" {
    cidr_block      = var.subnet_cidrs[0] 
    tags            = {
        Name        = "web1"
    } 
    availability_zone = var.az_a
    vpc_id          = aws_vpc.ntier.id 
}

resource "aws_subnet" "web2" {
    cidr_block      = var.subnet_cidrs[1] 
    tags            = {
        Name        = "web2"
    } 
    availability_zone = var.az_b
    vpc_id          = aws_vpc.ntier.id
}

resource "aws_subnet" "app1" {
    cidr_block      = var.subnet_cidrs[2] 
    tags            = {
        Name        = "app1"
    } 
    availability_zone = var.az_a
    vpc_id          = aws_vpc.ntier.id
}

resource "aws_subnet" "app2" {
    cidr_block      = var.subnet_cidrs[3] 
    tags            = {
        Name        = "app2"
    } 
    availability_zone = var.az_b
    vpc_id          = aws_vpc.ntier.id
}

resource "aws_subnet" "db1" {
    cidr_block      = var.subnet_cidrs[4] 
    tags            = {
        Name        = "db1"
    } 
    availability_zone = var.az_a
    vpc_id          = aws_vpc.ntier.id
}

resource "aws_subnet" "db2" {
    cidr_block      = var.subnet_cidrs[5] 
    tags            = {
        Name        = "db2"
    } 
    availability_zone = var.az_b
    vpc_id          = aws_vpc.ntier.id
}


resource "aws_internet_gateway" "ntier_igw" {
    vpc_id          = aws_vpc.ntier.id
    tags            = {
        Name        = "ntier-igw"
    } 
  
}


resource "aws_s3_bucket" "my_bucket" {
    bucket          = var.bucket_name 
  
}

