# VPC Section
resource "aws_vpc" "myvpc" {
    cidr_block              = "192.168.0.0/16"
    enable_dns_support      = true
    tags = {
        Name = "fromtf"
    }
}

# Web Subnet
resource "aws_subnet" "web" {
    vpc_id                  = aws_vpc.myvpc.id
    cidr_block              = "192.168.0.0/24"
    availability_zone       = "us-west-2a"
    
    tags = {
        Name = "web"
    }

}