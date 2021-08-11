data "aws_vpcs" "vpcs" {
  
}

data "aws_vpc" "default" {
    cidr_block = "172.31.0.0/16"
  
}

output "vpcs" {
    value = data.aws_vpcs.vpcs.ids
}

output "defaultvpcid" {
    value = data.aws_vpc.default.id
  
}