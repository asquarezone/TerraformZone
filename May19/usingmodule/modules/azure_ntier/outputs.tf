output "webserverip" {
  value = "${azurerm_public_ip.web.ip_address}"
}

output "web 1 subnet id" {
  value = "${data.azurerm_subnet.mysubnetquery.id}"
}

output "web 1 address prefix" {
  value = "${data.azurerm_subnet.mysubnetquery.address_prefix}"
}




