# creating a resource group

resource "azurerm_resource_group" "ntierrg" {
    name = "ntier"
    location = var.location
}

resource "azurerm_virtual_network" "ntiervnet" {
    name = "ntier-vnet"
    resource_group_name = azurerm_resource_group.ntierrg.name
    address_space = [ var.address_space ]
    location = var.location

    depends_on = [
      azurerm_resource_group.ntierrg
    ]
}

resource "azurerm_subnet" "subnets" {
    count = length(var.subnets)

    name = var.subnets[count.index]
    resource_group_name = azurerm_resource_group.ntierrg.name
    virtual_network_name = azurerm_virtual_network.ntiervnet.name
    address_prefixes = [cidrsubnet(var.address_space,8,count.index)]
  
}