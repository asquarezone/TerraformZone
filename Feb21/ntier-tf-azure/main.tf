provider "azurerm" {

    features {
    }
  
}

resource "azurerm_resource_group" "ntierrg" {
    name = local.rgname
    location = var.location
}

resource "azurerm_virtual_network" "ntiervnet" {
    name = "ntiervnet"
    resource_group_name = local.rgname
    location = var.location
    address_space = [ var.ntiervnetrange ]

    depends_on = [
      azurerm_resource_group.ntierrg
    ]
  
}

resource "azurerm_subnet" "subnets" {
    count = length(var.subnets)

    name = var.subnets[count.index]
    resource_group_name = local.rgname
    virtual_network_name = azurerm_virtual_network.ntiervnet.name
    address_prefixes = [ cidrsubnet(var.ntiervnetrange,8,count.index) ]

    depends_on = [
      azurerm_virtual_network.ntiervnet
    ]

  
}
