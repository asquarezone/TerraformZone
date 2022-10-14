resource "azurerm_resource_group" "my_res_grp" {
    name            = "fromterraform"
    location        = "eastus"
    tags            =  {
        project     = "qtlearning",
        env         = "dev"
    } 
  
}

resource "azurerm_storage_account" "my_store_acc" {
    name                        = "qtmystorageacctfoct14"
    resource_group_name         = "fromterraform"
    location                    = "eastus" 
    account_tier                = "Standard" 
    account_replication_type    = "GRS"
    tags                        =  {
        project                 = "qtlearning",
        env                     = "dev"
    } 
  
}


resource "azurerm_virtual_network" "my_vnet" {
    name                        = "vnet_from_tf"
    resource_group_name         = "fromterraform"
    location                    = "eastus" 
    address_space               =  [ "192.168.0.0/16" ]
  
}