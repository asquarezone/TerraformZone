resource "aws_vpc" "ntier_vpc" {
  cidr_block = var.vpc_network_cidr
  tags = {
    Name = local.name
  }
}


resource "aws_subnet" "web1" {
  vpc_id     = aws_vpc.ntier_vpc.id
  cidr_block = var.web1_subnet_cidr

  depends_on = [
    aws_vpc.ntier_vpc
  ]

}