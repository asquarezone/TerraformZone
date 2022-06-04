output "webserver_url" {
    value = format("http://%s", azurerm_linux_virtual_machine.webserver.public_ip_address)
  
}