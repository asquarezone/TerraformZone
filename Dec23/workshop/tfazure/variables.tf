variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  default = {
    name     = "workshop"
    location = "eastus"
  }
}