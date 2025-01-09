output "ssh-command" {
  value = "ssh -i ${var.webserver_info.private_key_path} ${var.webserver_info.admin_username}@${azurerm_linux_virtual_machine.web.public_ip_address}"

}