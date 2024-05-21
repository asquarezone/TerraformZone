data "azurerm_resource_group" "this" {
    name = var.resource_group_info.name
}

resource "azurerm_virtual_network" "ntier" {
    resource_group_name = data.azurerm_resource_group.this.name
    location = data.azurerm_resource_group.this.location
    name = "ntier"
    address_space = ["10.0.0.0/16"]
}