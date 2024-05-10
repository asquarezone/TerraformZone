# create a resource group
resource "azurerm_resource_group" "group" {
  name     = "ntier"
  location = "eastus"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}