data "aws_vpc" "default" {
  default = true
}


module "web_sg" {
  source = "./modules/my_security_group"
  security_group_info = {
    name        = "web"
    description = "this is web security group"
    vpc_id      = data.aws_vpc.default.id
    rules = [{
      from_port   = "22"
      to_port     = "22"
      type        = "ingress"
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = "80"
        to_port     = "80"
        type        = "ingress"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        from_port   = "443"
        to_port     = "443"
        type        = "ingress"
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }

}

resource "aws_internet_gateway" "test" {
  
}