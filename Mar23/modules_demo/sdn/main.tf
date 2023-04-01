resource "aws_vpc" "ntier" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "ntier",
    Env  = terraform.workspace
  }
}

resource "aws_subnet" "subnets" {
  count      = length(var.subnet_info.names)
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  vpc_id     = aws_vpc.ntier.id
  tags = {
    Name = var.subnet_info.names[count.index],
    Env  = terraform.workspace
    Type = contains(var.subnet_info.public_subnet_names, var.subnet_info.names[count.index]) ? "Public" : "Private"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ntier.id

  tags = {
    Name = "ntier"
    Env  = terraform.workspace
  }

}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.ntier.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

data "aws_subnets" "public_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.ntier.id]
  }
  tags = {
    Type = "Public"
  }

}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.ntier.id]
  }
  tags = {
    Type = "Private"
  }

}

resource "aws_route_table_association" "public" {
  count          = length(var.subnet_info.public_subnet_names)
  subnet_id      = data.aws_subnets.public_subnets.ids[count.index]
  route_table_id = aws_route_table.public.id
  depends_on = [
    data.aws_subnets.public_subnets,
    data.aws_subnets.private_subnets,
    aws_subnet.subnets
  ]

}