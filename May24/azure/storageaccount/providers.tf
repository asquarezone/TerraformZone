terraform {
  # This is about provider version requirements
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.100.0"
    }

  }
  # This is about terrform version requirements
  required_version = "~> 1.8.0"

}

# This block is for the azurerm provider which uses 
#cli authentication
provider "azurerm" {
  features {

  }
}

