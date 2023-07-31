resource "azurerm_resource_group" "ntier" {
  name     = var.resource_group_name
  location = var.location
}