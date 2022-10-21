resource "azurerm_virtual_network" "ntier_vnet" {
    name = var.vnet_details.name
    location = var.resourcegroup_details.location
    resource_group_name = var.resourcegroup_details.name
    address_space = var.vnet_details.address_space
    depends_on = [
      azurerm_resource_group.ntier
    ]
  
}