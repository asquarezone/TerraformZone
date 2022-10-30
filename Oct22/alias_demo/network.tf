resource "aws_vpc" "primaryvpc" {
    provider = aws.primary
    cidr_block = "192.168.0.0/16"
}

resource "aws_vpc" "secondary" {
    provider = aws.secondary
    cidr_block = "10.0.0.0/16"
  
}

output "primaryvpcid" {
    value = aws_vpc.primaryvpc.id
}

output "secondaryvpcid" {
    value = aws_vpc.secondary.id
  
}