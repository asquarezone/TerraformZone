resource "azurerm_resource_group" "ntierrg" {
    location    = "eastus"
    name        = "ntier-rg"
    tags        = {
        Env     = "Development"
    }
  
}