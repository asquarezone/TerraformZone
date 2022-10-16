resource "azurerm_resource_group" "my_res_grp" {
    name            = var.resource_group_name
    location        = var.target_region
    tags            =  {
        project     = "qtlearning",
        env         = "dev"
    } 
  
}


resource "azurerm_virtual_network" "my_vnet" {
    name                        = "vnet_from_tf"
    resource_group_name         = var.resource_group_name
    location                    = var.target_region 
    address_space               =  var.address_space

    # explicit dependency to wait till resource group is created
    depends_on = [
      azurerm_resource_group.my_res_grp
    ]
  
}