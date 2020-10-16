data "aws_vpc" "default" {
    default     = true
}


data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "extra" {
    vpc_id      = data.aws_vpc.default.id
    cidr_block  = cidrsubnet(data.aws_vpc.default.cidr_block, 4, length(data.aws_availability_zones.available.names))
}