data "azurerm_subnet" "example" {
  name                 = "Subnet-1"
  virtual_network_name = "ntier"
  resource_group_name  = "testbicep"
}

data "azurerm_network_security_group" "openall" {
  name                = "openall"
  resource_group_name = "testbicep"

}