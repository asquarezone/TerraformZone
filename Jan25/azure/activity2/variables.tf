variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  description = "resource group info"
}

variable "vnet_address_space" {
  type        = string
  description = "cidr range of network"
}

variable "subnets" {
  type = list(object({
    name          = string
    address_space = string
  }))
  description = "subnets information"

}
