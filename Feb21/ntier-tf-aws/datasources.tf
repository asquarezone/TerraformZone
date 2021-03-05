# datasource to fetch subnet ids
# web1 and web2
data "aws_subnet_ids" "publicsubnets" {
    vpc_id = aws_vpc.ntiervpc.id
    filter {
      name = "tag:Name"
      values = [local.subnets[0], local.subnets[1]]
    }
  
}