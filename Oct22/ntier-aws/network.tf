# create a vpc
resource "aws_vpc" "ntiervpc" {
    cidr_block = var.cidr_block
    tags = {
      "Name" = "ntier"
    }
}


resource "aws_subnet" "subnets" {
    count = 3
    cidr_block = var.subnet_cidrs[count.index]
    vpc_id = aws_vpc.ntiervpc.id
    tags = {
      "Name" = var.subnet_name_tags[count.index]
    }
}


