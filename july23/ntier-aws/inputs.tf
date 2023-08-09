variable "vpc_network_cidr" {
  type        = string
  description = "This is network cidr"
}

variable "subnet_names" {
  type        = list(string)
  description = "These are subnet names"
}

variable "subnet_azs" {
  type        = list(string)
  description = "These are azs"
}

variable "db_subnet_names" {
  type        = list(string)
  description = "these are database subnet names"
}

variable "web_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "this is web security group config"
}

variable "app_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "this is app security group config"
}


variable "db_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "this is db security group config"
}
variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "ubuntu_ami_id" {
  type    = string
  default = "ami-0f8e81a3da6e2510a"
}

variable "app_ec2_size" {
  type    = string
  default = "t2.micro"
}


variable "app_subnet_name" {
  type    = string
  default = "app1"

}


