

resource "aws_vpc" "ntier" {
  cidr_block = var.ntier_vpc_info.vpc_cidr
  tags = {
    Name = "ntier"
  }

}

resource "aws_subnet" "subnets" {
  count             = length(var.ntier_vpc_info.subnet_names)
  cidr_block        = cidrsubnet(var.ntier_vpc_info.vpc_cidr, 8, count.index)
  availability_zone = "${var.region}${var.ntier_vpc_info.subnet_azs[count.index]}"
  vpc_id            = local.vpc_id
  depends_on = [
    aws_vpc.ntier
  ]
  tags = {
    Name = var.ntier_vpc_info.subnet_names[count.index]
  }

}


resource "aws_internet_gateway" "ntier_igw" {
  vpc_id = local.vpc_id
  tags = {
    Name = "ntier-igw"
  }
  depends_on = [
    aws_vpc.ntier
  ]
}


resource "aws_route_table" "private" {
  vpc_id = local.vpc_id
  tags = {
    Name = "private"
  }

  depends_on = [
    aws_subnet.subnets
  ]
}

resource "aws_route_table" "public" {
  vpc_id = local.vpc_id
  tags = {
    Name = "public"
  }
  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.ntier_igw.id
  }

  depends_on = [
    aws_subnet.subnets
  ]
}