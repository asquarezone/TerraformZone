terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.10.0"
    }
  }
  required_version = ">= 1.4.0"
  backend "azurerm" {
    resource_group_name  = "bcdr"
    storage_account_name = "qtterraform"
    container_name       = "terraform"
    key                  = "awssample"

  }

}

provider "aws" {
  region = "us-west-1"
}