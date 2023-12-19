terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.85.0"
    }
  }
  required_version = "> 1.5.0"
}

provider "azurerm" {
  features {

  }
}