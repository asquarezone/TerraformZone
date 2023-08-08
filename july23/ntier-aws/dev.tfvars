vpc_network_cidr = "10.10.0.0/16"
subnet_names     = ["web1", "web2", "app1", "app2", "db1", "db2"]
db_subnet_names  = ["db1", "db2"]
subnet_azs       = ["us-west-1b", "us-west-1c", "us-west-1b", "us-west-1c", "us-west-1b", "us-west-1c"]
web_sg_config = {
  name        = "websg"
  description = "this is websecurity group"
  rules = [{
    type       = "ingress"
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    },
    {
      type       = "ingress"
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]
}

db_sg_config = {
  name        = "dbsg"
  description = "this is dbsecurity group"
  rules = [{
    type       = "ingress"
    from_port  = 3306
    to_port    = 3306
    protocol   = "tcp"
    cidr_block = "10.10.0.0/16"
    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]
}
app_sg_config = {
  name        = "appsg"
  description = "this is appsecurity group"
  rules = [{
    type       = "ingress"
    from_port  = 8080
    to_port    = 8080
    protocol   = "tcp"
    cidr_block = "10.10.0.0/16"
    },
    {
      type       = "ingress"
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]
}