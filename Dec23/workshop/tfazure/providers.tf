terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "state"
    storage_account_name = "qtterraformdec23"
    container_name       = "states"
    key                  = "workshop.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}


# implement workspace