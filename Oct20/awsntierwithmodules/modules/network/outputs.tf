output primary_vpc_id {
  value       = aws_vpc.ntier.id
  description = "This represents vpc id"
  depends_on  = []
}

output subnets {
  value       = aws_subnet.subnets[*].id
  description = "all subnet ids"
}

