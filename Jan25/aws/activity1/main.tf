resource "aws_vpc" "network" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "ntier"
  }

}

resource "aws_subnet" "web1" {
  vpc_id            = aws_vpc.network.id
  availability_zone = var.subnet_azs[0]
  cidr_block        = var.subnet_cidrs[0]
  tags = {
    Name = "web-1"
  }
  depends_on = [aws_vpc.network]

}

resource "aws_subnet" "web2" {
  vpc_id            = aws_vpc.network.id
  cidr_block        = var.subnet_cidrs[1]
  availability_zone = var.subnet_azs[1]
  tags = {
    Name = "web-2"
  }
  depends_on = [aws_vpc.network]

}

resource "aws_subnet" "db1" {
  vpc_id            = aws_vpc.network.id
  availability_zone = var.subnet_azs[2]
  cidr_block        = var.subnet_cidrs[2]
  tags = {
    Name = "db-1"
  }
  depends_on = [aws_vpc.network]

}

resource "aws_subnet" "db2" {
  vpc_id            = aws_vpc.network.id
  cidr_block        = var.subnet_cidrs[3]
  availability_zone = var.subnet_azs[3]
  tags = {
    Name = "db-2"
  }
  depends_on = [aws_vpc.network]

}