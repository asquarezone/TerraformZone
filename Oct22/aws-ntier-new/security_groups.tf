resource "aws_security_group" "rds_sg" {
    description = "Created by terraform for mysql"
    ingress   {
      cidr_blocks = [ local.anywhere ]
      description = "open mysql"
      from_port = local.mysql_port
      protocol = local.tcp
      to_port = local.mysql_port
      
    } 
    vpc_id = module.vpc.vpc_id
    depends_on = [
      module.vpc
    ]
    tags = {
      "Name" = "openmysql"
    }
}


resource "aws_security_group" "web_sg" {
    description = "Created by terraform for web"
    ingress   {
      cidr_blocks = [ local.anywhere ]
      description = "open http"
      from_port = local.http_port
      protocol = local.tcp
      to_port = local.http_port
      
    } 
    ingress   {
      cidr_blocks = [ local.anywhere ]
      description = "open ssh"
      from_port = local.ssh_port
      protocol = local.tcp
      to_port = local.ssh_port
      
    }
    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    } 
    vpc_id = module.vpc.vpc_id
    depends_on = [
      module.vpc
    ]
    tags = {
      "Name" = "openmysql"
    }
}