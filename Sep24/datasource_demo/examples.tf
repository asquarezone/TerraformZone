# lets fetch default vpc id of mumbai region
data "aws_vpc" "default" {
  default = true
}

output "default-vpc-id" {
  value = data.aws_vpc.default.id
}

data "azurerm_network_security_group" "web" {
    name = "web"
    resource_group_name = "ntier"
  
}

output "nsg_id" {
    value = data.azurerm_network_security_group.web.id
}

# get the resource group name and location and create a new network
data "azurerm_resource_group" "base" {
    name = "ntier1"
}

resource "azurerm_virtual_network" "new" {
    name = "new"
    resource_group_name = data.azurerm_resource_group.base.name
    location = data.azurerm_resource_group.base.location
    address_space = ["10.0.0.0/16"]
  
}