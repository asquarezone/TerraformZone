resource "azurerm_resource_group" "myresg" {
    name = "dynamicdemo"
    location = "eastus"
  
}

resource "azurerm_virtual_network" "dynamic_block" {
  name                = "vnet-dynamicblock-example-centralus"
  resource_group_name = azurerm_resource_group.myresg.name
  location            = azurerm_resource_group.myresg.location
  address_space       = ["10.10.0.0/16"]

  dynamic "subnet" {
    for_each = var.subnets
    iterator = item
    content  {
        name = item.value.name
        address_prefix = item.value.address_prefix 
    }
  }

#   subnet {
#     name           = "snet1"
#     address_prefix = "10.10.1.0/24"
#   }

#   subnet {
#     name           = "snet2"
#     address_prefix = "10.10.2.0/24"
#   }

#   subnet {
#     name           = "snet3"
#     address_prefix = "10.10.3.0/24"
#   }

#   subnet {
#     name           = "snet4"
#     address_prefix = "10.10.4.0/24"
#   }

  depends_on = [
    azurerm_resource_group.myresg
  ]
}