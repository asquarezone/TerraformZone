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