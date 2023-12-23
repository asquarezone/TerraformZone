variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "network_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_names" {
  type    = list(string)
  default = ["test", "business", "data"]

}

variable "nsg_names" {
  type    = list(string)
  default = ["web", "business", "data"]

}

variable "webnsg_rules_info" {
  type = list(object({
    name                       = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    direction                  = string
    source_address_prefix      = string
    destination_address_prefix = string
    access                     = string
    priority                   = number
    nsg_name                   = string
  }))

  default = [{
    name                       = "AllowHttp"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "80"
    direction                  = "Inbound"
    access                     = "Allow"
    priority                   = 300
    nsg_name                   = "web"
    },
    {
      name                       = "AllowHttps"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      source_port_range          = "*"
      destination_address_prefix = "*"
      destination_port_range     = "443"
      direction                  = "Inbound"
      access                     = "Allow"
      priority                   = 310
      nsg_name                   = "web"
    }
  ]

}



