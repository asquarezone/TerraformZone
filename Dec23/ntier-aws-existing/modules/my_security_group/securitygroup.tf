// module arguments

variable "security_group_info" {
  type = object({
    name        = string
    description = string
    vpc_id      = string
    rules = list(object({
      from_port   = string
      to_port     = string
      type        = string
      protocol    = string
      cidr_blocks = list(string)
    }))
  })

  default = {
    name        = "web"
    description = "this is web security group"
    vpc_id      = ""
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



resource "aws_security_group" "web" {
  description = var.security_group_info.description
  name        = var.security_group_info.name
  vpc_id      = var.security_group_info.vpc_id


}

resource "aws_security_group_rule" "allowssh" {
  count             = length(var.security_group_info.rules)
  from_port         = var.security_group_info.rules[count.index].from_port
  to_port           = var.security_group_info.rules[count.index].to_port
  type              = var.security_group_info.rules[count.index].type
  security_group_id = aws_security_group.web.id
  protocol          = var.security_group_info.rules[count.index].protocol
  cidr_blocks       = var.security_group_info.rules[count.index].cidr_blocks
}


// module attributes
output "security_group_id" {
  value = aws_security_group.web.id
}

output "security_group_name" {
    value = aws_security_group.web.name
  
}