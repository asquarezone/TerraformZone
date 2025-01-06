variable "region" {
  type        = string
  description = "Region"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
}

variable "network_name" {
  type        = string
  description = "name for reference"
  default     = "ntier"
}

variable "private_subnets" {
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  description = "private subnets"

}

variable "public_subnets" {
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  description = "private subnets"

}

variable "web_security_group" {
  type = object({
    name        = optional(string, "web-sg")
    description = optional(string, "This is security group for web server")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
      }
    ))
  })
  description = "web security group"

}

variable "db_security_group" {
  type = object({
    name        = optional(string, "db-sg")
    description = optional(string, "This is security group for db server")
    rules = list(object({
      cidr_ipv4   = optional(string, "0.0.0.0/0")
      from_port   = number
      to_port     = number
      ip_protocol = optional(string, "tcp")
      }
    ))
  })
  description = "web security group"

}

variable "key_file_info" {
  type = object({
    name             = string
    public_key_path  = optional(string, "~/.ssh/id_rsa.pub")
    private_key_path = optional(string, "~/.ssh/id_rsa")
  })
}

variable "web_server_info" {
  type = object({
    name                = string
    ami                 = optional(string, "ami-053b12d3152c0cc71")
    instance_type       = optional(string, "t2.micro")
    associate_public_ip = optional(bool, true)
    username            = optional(string, "ubuntu")
  })

}
