resource "azurerm_mssql_server" "dbserver" {
    name                            = var.servername
    resource_group_name             = azurerm_resource_group.infra_rg.name
    location                        = azurerm_resource_group.infra_rg.location
    version                         = "12.0"
    administrator_login             = "qtdevops" 
    administrator_login_password    = "motherindia@123"

    depends_on              = [
        azurerm_subnet.subnets
    ]
  
}

resource "azurerm_mssql_database" "sqldb" {
    name                            = var.dbname 
    server_id                       = azurerm_mssql_server.dbserver.id
    sku_name                        = "Basic"

    depends_on = [
      azurerm_mssql_server.dbserver
    ]
}

# data "azurerm_subnet" "dbsubnet" {
#     resource_group_name             = azurerm_resource_group.infra_rg.name
#     virtual_network_name            = azurerm_virtual_network.ntier.name
#     name                            = var.private_endpoint_subnet

#     depends_on = [
#       azurerm_subnet.subnets,
#       azurerm_mssql_database.sqldb
#     ]
  
# }

# resource "azurerm_private_endpoint" "dbendpoint" {
#     name                            = "dbendpointfromtf"
#     resource_group_name             = azurerm_resource_group.infra_rg.name
#     location                        = azurerm_resource_group.infra_rg.location
#     subnet_id                       = data.azurerm_subnet.dbsubnet.id

#     private_service_connection {

#         name                       = "dbprivateconnection"
#         is_manual_connection       = false
#         subresource_names          = ["sqlServer"]
#     }

#     depends_on              = [
#       azurerm_mssql_database.sqldb
#     ]
  
# }