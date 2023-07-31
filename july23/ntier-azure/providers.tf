terraform {
  # this is terraform provider i.e. azurerm version constraints
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.67.0"
    }
  }
  # this is terraform version constraints
  required_version = ">= 1.5.0"

}

provider "azurerm" {
    features {
      
    }
  
}