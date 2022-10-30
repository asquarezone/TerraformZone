terraform {
  backend "azurerm" {
    resource_group_name  = "terraformbackened"
    storage_account_name = "qtterraformbackend"
    container_name       = "terraformstate"
    key                  = "ntier.tfstate"
  }
}
