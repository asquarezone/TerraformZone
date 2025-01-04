resource "aws_vpc" "network" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "ntier"
  }

}

resource "aws_subnet" "subnets" {
  count             = 4
  vpc_id            = aws_vpc.network.id
  availability_zone = var.subnet_azs[count.index]
  cidr_block        = var.subnet_cidrs[count.index]
  depends_on        = [aws_vpc.network]
  tags = {
    Name = var.subnet_names[count.index]
  }

}
