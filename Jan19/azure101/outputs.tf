
output "addressspace" {
  value = "${azurerm_virtual_network.myfirstvnet.address_space}"
}


output "vnetid" {
  value = "${azurerm_virtual_network.myfirstvnet.id}"
}

