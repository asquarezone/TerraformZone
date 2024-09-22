output "ssh-command" {
  value = "ssh -i ~/.ssh/id_rsa Dell@${azurerm_linux_virtual_machine.web.public_ip_address}"

}