variable "resource_group_info" {
  type = object({
    name     = string
    location = string
  })
  description = "resource group informatio"
}

variable "network_info" {
  type = object({
    name          = string
    address_space = list(string)
  })
  description = "network info"
}

variable "subnets_info" {
  type = list(object({
    name          = string
    address_space = list(string)
  }))
  description = "subnets information"
}

variable "web_nsg_info" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      priority                   = number
      description                = string
      direction                  = string # Inbound or Outbound
      access                     = string # Allow or Deny
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  })

}

variable "app_nsg_info" {
  type = object({
    name = string
    rules = list(object({
      name                       = string
      priority                   = number
      description                = string
      direction                  = string # Inbound or Outbound
      access                     = string # Allow or Deny
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  })

}

variable "public_ip_info" {
  type = object({
    name              = string
    allocation_method = string
    sku               = string
  })
}
