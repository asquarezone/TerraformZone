resource "aws_vpc" "ntier_vpc" {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "workshop"
  }
}