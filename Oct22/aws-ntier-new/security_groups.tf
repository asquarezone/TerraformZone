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