resource "aws_vpc" "base" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name    = "terraform"
    Env     = "Dev"
    Project = "Learning"
  }
}

resource "aws_subnet" "one" {
  availability_zone = "ap-south-1a"
  vpc_id            = aws_vpc.base.id
  cidr_block        = "10.0.0.0/24"
  tags = {
    Name    = "web-1"
    Env     = "Dev"
    Project = "Learning"
  }
}

resource "aws_subnet" "two" {
  availability_zone = "ap-south-1b"
  vpc_id            = aws_vpc.base.id
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name    = "web-2"
    Env     = "Dev"
    Project = "Learning"
  }
}

resource "aws_subnet" "three" {
  availability_zone = "ap-south-1a"
  vpc_id            = aws_vpc.base.id
  cidr_block        = "10.0.2.0/24"
  tags = {
    Name    = "db-1"
    Env     = "Dev"
    Project = "Learning"
  }
}

resource "aws_subnet" "four" {
  availability_zone = "ap-south-1b"
  vpc_id            = aws_vpc.base.id
  cidr_block        = "10.0.3.0/24"
  tags = {
    Name    = "db-2"
    Env     = "Dev"
    Project = "Learning"
  }
}
