output "azure_publicip" {
  value = azurerm_linux_virtual_machine.web1vm.public_ip_address
}