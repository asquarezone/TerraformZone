variable "resource_group_config" {
  type = object({
    name     = string
    location = string
  })
  default = {
    name     = "terraform"
    location = "eastus"
  }

}

variable "vnet_config" {
  type = object({
    name       = string
    cidr_block = string
  })
  default = {
    name       = "ntier"
    cidr_block = "10.0.0.0/16"
  }

}

variable "subnets_config" {
  type = list(object({
    name       = string
    cidr_block = string
  }))
  default = [{
    name       = "web"
    cidr_block = "10.0.0.0/24"
    }, {
    name       = "app-1"
    cidr_block = "10.0.1.0/24"
    }, {
    name       = "app-2"
    cidr_block = "10.0.2.0/24"
    }, {
    name       = "db"
    cidr_block = "10.0.3.0/24"
    },
  ]

}

