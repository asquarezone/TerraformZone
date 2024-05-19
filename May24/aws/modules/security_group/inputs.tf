variable "security_group_info" {
  type = object({
    name        = string
    description = string
    vpc_id      = string
    inbound_rules = list(object({
      cidr        = string
      port        = number
      protocol    = string
      description = string
    }))
    outbound_rules = list(object({
      cidr        = string
      from_port   = number
      protocol    = string
      description = string
      to_port     = number
    }))
    allow_all_egress = bool
  })
  description = "security group info"
}