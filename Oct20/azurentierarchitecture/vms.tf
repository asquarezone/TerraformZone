module "webserver" {
  source              = "Azure/compute/azurerm"
  resource_group_name = local.resg_name
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = ["webserverqtlt"] 
  vnet_subnet_id      = azurerm_subnet.subnets[local.web_subnet_index].id

  depends_on = [azurerm_subnet.subnets ]
}

module "appserver" {
  source              = "Azure/compute/azurerm"
  resource_group_name = local.resg_name
  vm_os_simple        = "UbuntuServer"
  public_ip_dns       = ["appserverqtlt"] 
  vnet_subnet_id      = azurerm_subnet.subnets[local.app_subnet_index].id

  depends_on = [azurerm_subnet.subnets ]
}