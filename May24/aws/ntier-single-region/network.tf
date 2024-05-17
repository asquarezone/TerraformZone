resource "aws_vpc" "network" {
  cidr_block = var.network_info.cidr
  tags = {
    Name = var.network_info.name
  }
}

# private subnets
resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.network.id
  cidr_block        = var.private_subnets[count.index].cidr
  availability_zone = var.private_subnets[count.index].az
  tags = {
    Name = var.private_subnets[count.index].name
  }

  depends_on = [aws_vpc.network]
}

# create internet gateway

resource "aws_internet_gateway" "ntier" {
  vpc_id = aws_vpc.network.id
  tags = {
    Name = "ntier"
  }
  depends_on = [aws_vpc.network]
}

# create a public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ntier.id
  }
  depends_on = [
    aws_vpc.network,
    aws_internet_gateway.ntier
  ]
}

# public subnets
resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.network.id
  cidr_block        = var.public_subnets[count.index].cidr
  availability_zone = var.public_subnets[count.index].az
  tags = {
    Name = var.public_subnets[count.index].name
  }
  depends_on = [aws_vpc.network]

}

# associate public subnets with public route table
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
  depends_on = [
    aws_subnet.public,
    aws_route_table.public
  ]
}