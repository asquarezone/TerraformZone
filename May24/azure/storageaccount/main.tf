# declare a resource group
resource "azurerm_resource_group" "group" {
  name     = "learning"
  location = "centralindia"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}

# declare a storage account
resource "azurerm_storage_account" "store" {
  name                     = "qtstoremay092024"
  resource_group_name      = "learning"
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}