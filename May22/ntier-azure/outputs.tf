output "webserver_url" {
    value = format("http://%s", azurerm_linux_virtual_machine.webserver.public_ip_address)
  
}

output "appserver_ip" {
    value = azurerm_linux_virtual_machine.appserver.private_ip_address
}

output "database_endpoint" {
    value = azurerm_mssql_server.dbserver.fully_qualified_domain_name
}