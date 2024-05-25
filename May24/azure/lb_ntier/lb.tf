# public ip address for load balancer
resource "azurerm_public_ip" "lb" {
  name                = "lb-pip"
  location            = azurerm_network_security_group.preschool.location
  resource_group_name = azurerm_network_security_group.preschool.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "preschool" {
  name                = "preschool-lb"
  location            = azurerm_network_security_group.preschool.location
  resource_group_name = azurerm_network_security_group.preschool.resource_group_name
  sku                 = "Standard"
  frontend_ip_configuration {
    name                 = "preschool-lb-ip"
    public_ip_address_id = azurerm_public_ip.lb.id
  }


}

resource "azurerm_lb_backend_address_pool" "preschool" {
  name               = "preschool-pool"
  loadbalancer_id    = azurerm_lb.preschool.id
  virtual_network_id = azurerm_virtual_network.preschool.id

}

resource "azurerm_lb_probe" "preschool" {
  loadbalancer_id     = azurerm_lb.preschool.id
  name                = "preschool-probe"
  protocol            = "Http"
  port                = 80
  probe_threshold     = 2
  interval_in_seconds = 5
  request_path        = "/"


}

resource "azurerm_lb_rule" "http" {
  name                           = "http-rule"
  loadbalancer_id                = azurerm_lb.preschool.id
  frontend_ip_configuration_name = azurerm_lb.preschool.frontend_ip_configuration[0].name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.preschool.id]
  probe_id                       = azurerm_lb_probe.preschool.id

}