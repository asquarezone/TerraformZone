# Create a resource group

resource "azurerm_resource_group" "base" {
  name     = var.purpose
  location = var.location
}