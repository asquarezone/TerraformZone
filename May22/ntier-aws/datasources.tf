data "aws_subnet_ids" "db_subnet_ids" {
    vpc_id      = aws_vpc.ntier.id
    filter {
      name      = "tag:Name"
      values    = var.db_subnets 
    }
  
}