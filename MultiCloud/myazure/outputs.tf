data "azurerm_public_ip" "terraform" {
  name                = "${azurerm_public_ip.terraform.name}"
  resource_group_name = "${azurerm_virtual_machine.web.resource_group_name}"
}

output "public_ip_address" {
  value = "${data.azurerm_public_ip.terraform.ip_address}"
}
