resource "azurerm_resource_group" "ntier" {
    name = var.resourcegroup_details.name
    location = var.resourcegroup_details.location
}