terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.104.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.50.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}

provider "aws" {
  region = "ap-south-1"
}