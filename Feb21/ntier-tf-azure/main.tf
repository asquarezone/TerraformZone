provider "azurerm" {

    features {
    }
  
}

resource "azurerm_resource_group" "ntierrg" {
    name = "ntierrg"
    location = "east-us"
}