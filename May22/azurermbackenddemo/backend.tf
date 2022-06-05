terraform {
  backend "azurerm" {
    resource_group_name  = "fortf"
    storage_account_name = "qttfstatestorage"
    container_name       = "terraform"
    key                  = "azurebackenddemo.tfstate"
  }
}
