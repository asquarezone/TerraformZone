module "securitygroup" {
  source = "./modules/securitygroup"
  securitygroup_config = {
    name        = "websg"
    description = "this is websecurity group"
    vpc_id = "vpc-0e42fdc4150bedb37"
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

}