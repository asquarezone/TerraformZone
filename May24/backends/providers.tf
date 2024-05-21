terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.104.2"
    }
  }
  backend "azurerm" {
    resource_group_name = "terraformstate"
    storage_account_name = "ltbackendstorage"
    container_name = "state"
    key = "example.tfstate"
    
  }
}

provider "azurerm" {
  features {
    
  }
}