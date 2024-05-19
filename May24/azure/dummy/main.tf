resource "azurerm_resource_group" "sample" {
  name     = "dummy1"
  location = "eastus"
  tags = {
    Environment = "dev"
    CreatedBy   = "Terraform"
    Owner       = "DevOps"
  }
}