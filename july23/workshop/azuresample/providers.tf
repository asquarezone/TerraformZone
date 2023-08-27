terraform {
  # this is terraform provider i.e. azurerm version constraints
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.67.0"
    }
  }
  # this is terraform version constraints
  required_version = ">= 1.5.0"
  backend "azurerm" {
    resource_group_name  = "bcdr"
    storage_account_name = "qtterraform"
    container_name       = "terraform"
    key                  = "azuresample"

  }

}

provider "azurerm" {
  features {

  }

}