resource "aws_vpc" "primary_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
      Name = "primary"
  }
}


resource "aws_subnet" "web_1" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = var.subnet_azs[0]
  cidr_block = var.subnet_cidrs[0]
  tags = {
      Name = var.subnet_names[0]
  }
}

resource "aws_subnet" "web_2" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = var.subnet_azs[1]
  cidr_block = var.subnet_cidrs[1]
  tags = {
      Name = var.subnet_names[1]
  }
}


resource "aws_subnet" "db_1" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = var.subnet_azs[2]
  cidr_block = var.subnet_cidrs[2]
  tags = {
      Name = var.subnet_names[2]
  }
}

resource "aws_subnet" "db_2" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = var.subnet_azs[3]
  cidr_block = var.subnet_cidrs[3]
  tags = {
      Name = var.subnet_names[3]
  }
}

