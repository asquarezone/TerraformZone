variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  description = "resource group info"
}

variable "network_info" {
  type = object({
    name          = string
    address_space = string
    subnets = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  })

}