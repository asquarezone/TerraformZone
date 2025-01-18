variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
  default     = "10.0.0.0/16"
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
  default = [{
    name = "app-1"
    cidr = "10.0.0.0/24"
    az   = "ap-south-1a"
    }, {
    name = "app-2"
    cidr = "10.0.1.0/24"
    az   = "ap-south-1b"
  }]

}

variable "public_subnets" {
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  description = "private subnets"
  default = [{
    name = "web-1"
    cidr = "10.10.10.0/24"
    az   = "ap-south-1a"
    }, {
    name = "web-2"
    cidr = "10.10.11.0/24"
    az   = "ap-south-1b"
    }
  ]

}
