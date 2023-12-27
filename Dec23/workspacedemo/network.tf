resource "azurerm_resource_group" "root" {
  name     = var.resource_group_name
  location = "eastus"
  tags = {
    Env = terraform.workspace
  }
}