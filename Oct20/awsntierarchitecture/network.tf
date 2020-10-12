resource "aws_vpc" "ntier" {
    cidr_block  = var.primary_network_cidr
    tags        = {
        Name    = "ntier primary"
    }
}