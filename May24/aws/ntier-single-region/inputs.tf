variable "network_info" {
  type = object({
    name = string
    cidr = string
  })
}

variable "public_subnets" {
  type = list(object({
    name = string,
    cidr = string,
    az   = string
    }
  ))
  description = "the public subnets"
}

variable "private_subnets" {
  type = list(object({
    name = string,
    cidr = string,
    az   = string
    }
  ))
  description = "private subnets"

}

