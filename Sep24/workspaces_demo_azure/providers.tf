terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "states"
    storage_account_name = "ltapplicationstates"
    container_name       = "states"
    key                  = "azuredemo/terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}