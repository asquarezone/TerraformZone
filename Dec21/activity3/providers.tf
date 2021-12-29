terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

provider "null" {
  
}

terraform {
  backend "azurerm" {
    resource_group_name  = "terraformstate"
    storage_account_name = "qttfstatemanagement"
    container_name       = "tfstates"
    key                  = "activity2.terraform.tfstate"
  }
}