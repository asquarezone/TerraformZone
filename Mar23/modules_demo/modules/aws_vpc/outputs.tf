output "vpc_id" {
    value = aws_vpc.ntier.id
}

output "public_subnet_ids" {
    value = data.aws_subnets.public_subnets.ids
}

output "private_subnet_ids" {
    value = data.aws_subnets.private_subnets.ids
}