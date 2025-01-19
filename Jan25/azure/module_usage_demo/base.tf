resource "azurerm_resource_group" "base" {
  name     = "module_demo"
  location = "eastus"
}

# create a virtual network

module "vnet" {
  source         = "github.com/dummyrepos/lttfmodules//azure/vnet?ref=v1.0.1"
  resource_group = azurerm_resource_group.base.name
  location       = azurerm_resource_group.base.location
  network_info = {
    address_space = ["10.0.0.0/16"]
    name          = "ntier"
    subnets = {
      web = "10.0.0.0/24"
      app = "10.0.1.0/24"
      db  = "10.0.2.0/24"
    }
  }
  tags = {
    Env = "Dev"
    Team = "DevOps"
  }
  depends_on = [azurerm_resource_group.base]

}
