resource "aws_vpc" "myvpc" {
    cidr_block              = "192.168.0.0/16"
    enable_dns_support      = true
    tags = {
        Name = "fromtf"
    }
}