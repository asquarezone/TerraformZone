resource "azurerm_sql_server" "ntierdbserver" {
    name                            = "qtntierfromtf"
    resource_group_name             = local.resource_group_name
    location                        = var.region
    version                         = "12.0" 
    administrator_login             = "qtdevops"
    administrator_login_password    = "motherindia@123"

    depends_on = [
      azurerm_resource_group.ntierrg
    ]
}

resource "azurerm_sql_database" "ntierdb" {
    name                            = "qtntierdb"
    resource_group_name             = local.resource_group_name
    location                        = var.region
    server_name                     = azurerm_sql_server.ntierdbserver.name
    edition                         = "Basic" 

    depends_on = [
      azurerm_sql_server.ntierdbserver
    ]
  
}


# Adding vnet connection
resource "azurerm_sql_virtual_network_rule" "allowntiervent" {
    name                            = "ntiervnetdb"
    resource_group_name             = local.resource_group_name
    server_name                     = azurerm_sql_server.ntierdbserver.name
    # needs to be fixed
    subnet_id                       = azurerm_subnet.subnets[2].id

    depends_on = [
      azurerm_sql_database.ntierdb,
      azurerm_subnet.subnets
    ] 
}

# Allow all the ip address from vnet range to access database
resource "azurerm_sql_firewall_rule" "allow_all_vnet" {
    name                            = "allowvnet"
    resource_group_name             = local.resource_group_name
    server_name                     = azurerm_sql_server.ntierdbserver.name
    start_ip_address                = cidrhost(var.vnet_range, 0)
    end_ip_address                  = cidrhost(var.vnet_range, 65535)


    depends_on = [
      azurerm_sql_database.ntierdb,
      azurerm_subnet.subnets
    ]
  
}