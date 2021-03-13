provider "azurerm" {

    features {
    }
  
}

resource "azurerm_resource_group" "ntierrg" {
    name = local.rgname
    location = var.location
}

resource "azurerm_virtual_network" "ntiervnet" {
    name = "ntiervnet"
    resource_group_name = local.rgname
    location = var.location
    address_space = [ var.ntiervnetrange ]

    depends_on = [
      azurerm_resource_group.ntierrg
    ]
  
}

resource "azurerm_subnet" "subnets" {
    count = length(var.subnets)

    name = var.subnets[count.index]
    resource_group_name = local.rgname
    virtual_network_name = azurerm_virtual_network.ntiervnet.name
    address_prefixes = [ cidrsubnet(var.ntiervnetrange,8,count.index) ]

    depends_on = [
      azurerm_virtual_network.ntiervnet
    ]

  
}

resource "azurerm_network_security_group" "webnsg" {
    name = local.webnsgname
    resource_group_name = local.rgname
    location = var.location

    security_rule  {
      access = "Allow"
      description = "allow ssh"
      destination_address_prefix = "*"
      destination_port_range = "22"
      direction = "Inbound"
      name = "SSH"
      priority = 1001
      protocol = "TCP"
      source_address_prefix = "*"
      source_port_range = "*"
    } 
    security_rule  {
      access = "Allow"
      description = "allow http"
      destination_address_prefix = "*"
      destination_port_range = "80"
      direction = "Inbound"
      name = "Http"
      priority = 1011
      protocol = "TCP"
      source_address_prefix = "*"
      source_port_range = "*"
    }
    security_rule  {
      access = "Allow"
      description = "allow https"
      destination_address_prefix = "*"
      destination_port_range = "443"
      direction = "Inbound"
      name = "Https"
      priority = 1021
      protocol = "TCP"
      source_address_prefix = "*"
      source_port_range = "*"
    } 

    depends_on = [
      azurerm_virtual_network.ntiervnet,
      azurerm_subnet.subnets
    ]

  
}
