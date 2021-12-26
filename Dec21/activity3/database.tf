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