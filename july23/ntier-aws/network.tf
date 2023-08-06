resource "aws_vpc" "ntier_vpc" {
  cidr_block = var.vpc_network_cidr
  tags = {
    Name = local.name
  }
}



resource "aws_subnet" "subnets" {
  count      = length(var.subnet_names)
  vpc_id     = aws_vpc.ntier_vpc.id
  cidr_block = cidrsubnet(var.vpc_network_cidr, 8, count.index)
  tags = {
    Name = var.subnet_names[count.index]
  }
  depends_on = [
    aws_vpc.ntier_vpc
  ]
}

data "aws_route_table" "default" {
  vpc_id = aws_vpc.ntier_vpc.id

  depends_on = [
    aws_vpc.ntier_vpc
  ]

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ntier_vpc.id

  tags = {
    Name = "ntier igw"
  }
  depends_on = [
    aws_vpc.ntier_vpc
  ]
}

resource "aws_route" "igwroute" {
  route_table_id         = data.aws_route_table.default.id
  destination_cidr_block = local.anywhere
  gateway_id             = aws_internet_gateway.igw.id

  depends_on = [
    aws_vpc.ntier_vpc,
    aws_internet_gateway.igw
  ]
}
