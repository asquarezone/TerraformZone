output "appserver_ip" {
  value = azurerm_linux_virtual_machine.appserver.private_ip_address
}

output "database_endpoint" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name

}