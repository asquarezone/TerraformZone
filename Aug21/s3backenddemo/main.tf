resource "aws_vpc" "ntier" {
    cidr_block = "10.10.0.0/16"
    tags = {
      "Name" = "ntier"
    }
  
}

resource "aws_subnet" "web" {
    cidr_block = "10.10.0.0/24"
    vpc_id = aws_vpc.ntier.id
    tags = {
      "Name" = "web"
    }
  
}