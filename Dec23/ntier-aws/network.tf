resource "aws_vpc" "primary_network" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "ntier"
  }
}


resource "aws_subnet" "subnets" {
  count      = length(var.subnet_names)
  vpc_id     = aws_vpc.primary_network.id
  cidr_block = cidrsubnet(var.vpc_cidr,8,count.index)
  tags = {
    Name = var.subnet_names[count.index]
  }
}