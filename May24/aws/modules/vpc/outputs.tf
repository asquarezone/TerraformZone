output "vpcid" {
    value = aws_vpc.network.id
}


output "public_subnets" {
    value = aws_subnet.public.*.id
}

output "private_subnets" {
    value = aws_subnet.private.*.id
}
