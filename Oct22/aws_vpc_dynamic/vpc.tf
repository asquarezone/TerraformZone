resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_range

    tags = {
      "Name" = "myvpcfromtf"
    }
  
}