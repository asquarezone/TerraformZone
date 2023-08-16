variable "securitygroup_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
      vpc_id     = string
    }))
  })
  description = "this is security group config"
}