terraform {
  backend "azurerm" {
      resource_group_name = "forterraform"
      storage_account_name = "qtforterraform"
      container_name = "state"
      key = "ntier.tfstate"
    
  }
}