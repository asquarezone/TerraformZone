resource "aws_vpc" "ntier" {
    cidr_block  = var.primary_network_cidr
    tags        = {
        Name    = "ntier primary"
    }
}

resource "aws_subnet" "subnets" {
    vpc_id      = aws_vpc.ntier.id
    count       = length(var.primary_subnets)
    cidr_block  = cidrsubnet(var.primary_network_cidr, 8, count.index)
    tags        = {
        Name    = var.primary_subnets[count.index]
    }
}