variable "vpc_info" {
  type = object({
    cidr_block           = string
    enable_dns_hostnames = bool
    tags                 = map(string)
  })
  description = "this refers to the vpc info"
}


variable "public_subnets" {
  type = list(object({
    cidr_block = string
    az         = string
    tags       = map(string)
  }))
  description = "this refers to the public subnets"
}


variable "private_subnets" {
  type = list(object({
    cidr_block = string
    az         = string
    tags       = map(string)
  }))
  description = "this refers to the public subnets"
}

variable "web_security_group" {
  type = object({
    name        = string
    description = string
    inbound_rules = list(object({
      protocol    = string
      port        = number
      source      = string
      description = string
    }))
  })
}

variable "app_security_group" {
  type = object({
    name        = string
    description = string
    inbound_rules = list(object({
      protocol    = string
      port        = number
      source      = string
      description = string
    }))
  })
}

variable "db_security_group" {
  type = object({
    name        = string
    description = string
    inbound_rules = list(object({
      protocol    = string
      port        = number
      source      = string
      description = string
    }))
  })
}