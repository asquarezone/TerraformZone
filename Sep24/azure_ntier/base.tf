# create a resource group

resource "azurerm_resource_group" "base" {
  name     = var.resource_group_info.name
  location = var.resource_group_info.location
}