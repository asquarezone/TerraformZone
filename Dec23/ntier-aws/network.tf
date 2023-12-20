resource "aws_vpc" "primary_network" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "ntier"
  }

}


resource "aws_subnet" "web" {
  cidr_block = var.web_cidr
  vpc_id     = aws_vpc.primary_network.id
  tags = {
    Name = "web"
  }
  depends_on = [aws_vpc.primary_network]
}

resource "aws_subnet" "business" {
  cidr_block = var.business_cidr
  vpc_id     = aws_vpc.primary_network.id
  tags = {
    Name = "business"
  }

  depends_on = [aws_vpc.primary_network]
}

resource "aws_subnet" "data" {
  cidr_block = var.data_cidr
  vpc_id     = aws_vpc.primary_network.id
  tags = {
    Name = "data"
  }

  depends_on = [aws_vpc.primary_network]
}