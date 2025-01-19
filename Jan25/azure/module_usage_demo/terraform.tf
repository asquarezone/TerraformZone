terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
  required_version = ">= 1.10.0"
  backend "azurerm" {
    # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    resource_group_name = "tfstate"
    # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    storage_account_name = "lttfstates"
    # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    container_name = "state"
    # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
    key = "module_usage.terraform.tfstate"

  }
}
