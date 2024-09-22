terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.68.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "aws" {
}