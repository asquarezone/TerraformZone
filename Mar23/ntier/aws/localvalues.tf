locals {
  vpc_id   = aws_vpc.ntier.id
  anywhere = "0.0.0.0/0"
}