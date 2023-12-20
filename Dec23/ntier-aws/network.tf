resource "aws_vpc" "primary_network" {
  cidr_block = "10.100.0.0/16"

  tags = {
    Name = "ntier"
  }

}


resource "aws_subnet" "web" {
  cidr_block = "10.100.0.0/24"
  vpc_id     = aws_vpc.primary_network.id
  tags = {
    Name = "web"
  }
  depends_on = [ aws_vpc.primary_network ]
}

resource "aws_subnet" "business" {
  cidr_block = "10.100.1.0/24"
  vpc_id     = aws_vpc.primary_network.id
  tags = {
    Name = "business"
  }

  depends_on = [ aws_vpc.primary_network ]
}

resource "aws_subnet" "data" {
  cidr_block = "10.100.2.0/24"
  vpc_id     = aws_vpc.primary_network.id
  tags = {
    Name = "data"
  }

  depends_on = [ aws_vpc.primary_network ]
}