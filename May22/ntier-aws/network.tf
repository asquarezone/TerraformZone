resource "aws_vpc" "ntier" {
    cidr_block      = var.network_cidr
    tags            = {
        Name        = "ntier"
    } 
}


resource "aws_subnet" "subnets" {
    count           = length(var.subnet_name_tags) 
    cidr_block      = cidrsubnet(var.network_cidr,8,count.index)
    tags            = {
        Name        = var.subnet_name_tags[count.index]
    } 
    availability_zone = format("${var.region}%s", count.index%2==0?"a":"b")
    vpc_id          = aws_vpc.ntier.id 
}


resource "aws_internet_gateway" "ntier_igw" {
    vpc_id          = aws_vpc.ntier.id
    tags            = {
        Name        = "ntier-igw"
    } 
  
}

resource "aws_s3_bucket" "my_bucket" {
    bucket          = var.bucket_name 
  
}

resource "aws_security_group" "websg" {
    vpc_id              = aws_vpc.ntier.id
    description         = local.default_description
    ingress {
        from_port       = local.ssh_port
        to_port         = local.ssh_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    } 
    ingress {
        from_port       = local.http_port
        to_port         = local.http_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    }
    egress {
        from_port       = local.all_ports
        to_port         = local.all_ports
        protocol        = local.any_protocol
        cidr_blocks      = [local.any_where]
        ipv6_cidr_blocks = [local.any_where_ip6]
    }
    tags = {
        Name            = "Web Security"
    } 
  
}

resource "aws_security_group" "appsg" {
    vpc_id              = aws_vpc.ntier.id
    description         = local.default_description
    ingress {
        from_port       = local.ssh_port
        to_port         = local.ssh_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    } 
    ingress {
        from_port       = local.app_port
        to_port         = local.app_port
        protocol        = local.tcp
        cidr_blocks     = [var.network_cidr]
    }
    egress {
        from_port       = local.all_ports
        to_port         = local.all_ports
        protocol        = local.any_protocol
        cidr_blocks      = [local.any_where]
        ipv6_cidr_blocks = [local.any_where_ip6]
    }
    tags = {
        Name            = "App Security Group"
    } 
  
}

