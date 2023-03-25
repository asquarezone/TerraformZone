resource "azurerm_mssql_server" "sql_server" {
  name                         = var.names.sql_server
  resource_group_name          = azurerm_resource_group.ntierrg.name
  location                     = azurerm_resource_group.ntierrg.location
  version                      = var.server_info.version
  administrator_login          = var.server_info.username
  administrator_login_password = var.server_info.password
  tags = {
    Env       = "Dev"
    CreatedBy = "Terraform"
  }
  depends_on = [
    azurerm_resource_group.ntierrg,
    azurerm_virtual_network.ntiervnet,
    azurerm_subnet.subnets
  ]

}

resource "azurerm_mssql_database" "sql_emp_db" {
  name      = var.database_info.name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = var.database_info.sku
  tags = {
    Env       = "Dev"
    CreatedBy = "Terraform"
  }
  depends_on = [
    azurerm_mssql_server.sql_server
  ]

}