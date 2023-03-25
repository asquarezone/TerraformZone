resource "azurerm_mssql_server" "sql_server" {
  name                         = var.names.sql_server
  resource_group_name          = azurerm_resource_group.ntierrg.name
  location                     = azurerm_resource_group.ntierrg.location
  version                      = "12.0"
  administrator_login          = "devops"
  administrator_login_password = "ThisPasswordisnotgreat@1"
  tags = {
    Env       = "Dev"
    CreatedBy = "Terraform"
  }
  depends_on = [
    azurerm_resource_group.ntierrg,
    azurerm_virtual_network.ntiervnet
  ]

}

resource "azurerm_mssql_database" "sql_emp_db" {
  name      = "employees"
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = "Basic"
  tags = {
    Env       = "Dev"
    CreatedBy = "Terraform"
  }

  depends_on = [
    azurerm_mssql_server.sql_server
  ]

}