resource "aws_vpc" "primary_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
      Name = "primary"
  }
}


resource "aws_subnet" "web_1" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = "us-west-2a"
  cidr_block = "192.168.0.0/24"
  tags = {
      Name = "Web1"
  }
}

resource "aws_subnet" "web_2" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = "us-west-2b"
  cidr_block = "192.168.1.0/24"
  tags = {
      Name = "Web2"
  }
}


resource "aws_subnet" "db_1" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = "us-west-2a"
  cidr_block = "192.168.2.0/24"
  tags = {
      Name = "db1"
  }
}

resource "aws_subnet" "db_2" {
  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = "us-west-2b"
  cidr_block = "192.168.3.0/24"
  tags = {
      Name = "db2"
  }
}

