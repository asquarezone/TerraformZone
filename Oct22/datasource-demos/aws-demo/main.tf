data "aws_vpc" "default" {
    default = true
}

data "aws_subnets" "subnetids" {
    filter {
      name = "availability-zone"
      values = [ "ap-south-1a" ]
    }

  
}

output "defaultvpcid" {
    value = data.aws_vpc.default.id
}

output "subnetids" {
    value = data.aws_subnets.subnetids.ids
}