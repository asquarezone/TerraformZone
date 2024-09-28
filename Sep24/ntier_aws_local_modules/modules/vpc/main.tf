# create a vpc
resource "aws_vpc" "base" {
  cidr_block           = var.vpc_info.cidr_block
  tags                 = var.vpc_info.tags
  enable_dns_hostnames = var.vpc_info.enable_dns_hostnames
}

# Create public subnets
resource "aws_subnet" "public" {
  count             = length(var.public_subnets)
  vpc_id            = aws_vpc.base.id
  cidr_block        = var.public_subnets[count.index].cidr_block
  availability_zone = var.public_subnets[count.index].az
  tags              = var.public_subnets[count.index].tags
  depends_on        = [aws_vpc.base]
}

# create private subnets

resource "aws_subnet" "private" {
  count             = length(var.private_subnets)
  vpc_id            = aws_vpc.base.id
  cidr_block        = var.private_subnets[count.index].cidr_block
  availability_zone = var.private_subnets[count.index].az
  tags              = var.private_subnets[count.index].tags
  depends_on        = [aws_vpc.base]
}


# create an internet gateway

resource "aws_internet_gateway" "ntier" {
  # conditional creation
  count  = local.do_we_have_public_subnets ? 1 : 0
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "ntier-igw"
  }
  depends_on = [aws_vpc.base]
}


# Create a public route table if there are public subnets
resource "aws_route_table" "public" {
  # conditional creation
  count  = local.do_we_have_public_subnets ? 1 : 0
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "public"
  }
  depends_on = [aws_vpc.base]
}


# lets assocaiate public subnets with public route table

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets)
  route_table_id = aws_route_table.public[0].id
  subnet_id      = aws_subnet.public[count.index].id
  depends_on     = [aws_route_table.public, aws_subnet.public]
}

# create a route to internet gateway in public route table
resource "aws_route" "internet" {
  count                  = local.do_we_have_public_subnets ? 1 : 0
  route_table_id         = aws_route_table.public[0].id
  destination_cidr_block = local.anywhere
  gateway_id             = aws_internet_gateway.ntier[0].id
}


# Create a private route table if there are private subnets
resource "aws_route_table" "private" {
  # conditional creation
  count  = local.do_we_have_private_subnets ? 1 : 0
  vpc_id = aws_vpc.base.id
  tags = {
    Name = "private"
  }

}


# lets assocaiate private subnets with private route table

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[0].id
  depends_on     = [aws_subnet.private, aws_route_table.private]
}
