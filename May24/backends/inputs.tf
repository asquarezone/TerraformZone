variable "resource_group_info" {
    type = object({
    name = string
    location = string
  })
  default = {
    name = "devdeployment"
    location = "eastus"
  }
}
