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
  #implicit dependency
  resource_group_name      = azurerm_resource_group.group.name
  location                 = azurerm_resource_group.group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
  # explicit dependency on the resource group
  depends_on = [ azurerm_resource_group.group ]
}
