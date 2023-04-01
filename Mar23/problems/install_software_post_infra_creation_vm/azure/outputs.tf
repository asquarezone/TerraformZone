output "apacheurl" {
  value = "http://${azurerm_linux_virtual_machine.apache.public_ip_address}"
}