resource "aws_vpc" "my_vpc" {
    cidr_block = "192.168.0.0/16"
    tags = {
      "Name" = "myvpcfromtf"
    }
  
}