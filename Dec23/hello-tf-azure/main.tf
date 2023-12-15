# Provider

provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "first" {
  name     = "fromterraform"
  location = "southindia"

}