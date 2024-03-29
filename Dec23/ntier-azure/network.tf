resource "azurerm_resource_group" "ntier" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Env       = "Dev"
    CreatedBy = "Terraform"
  }
}

resource "azurerm_virtual_network" "primary" {
  address_space = [var.network_cidr]
  name          = format("%s-primary", var.resource_group_name)
  // "${var.resource_group_name}-primary"
  location = var.location
  // implicit dependency
  resource_group_name = azurerm_resource_group.ntier.name

  // explicit dependency
  depends_on = [
    azurerm_resource_group.ntier
  ]

}


resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  address_prefixes     = [cidrsubnet(var.network_cidr, 8, count.index)]
  virtual_network_name = azurerm_virtual_network.primary.name
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.ntier.name
  depends_on           = [azurerm_virtual_network.primary]
}


resource "azurerm_network_security_group" "nsgs" {
  count               = length(var.nsg_names)
  name                = var.nsg_names[count.index]
  resource_group_name = azurerm_resource_group.ntier.name
  location            = var.location
  depends_on          = [azurerm_virtual_network.primary]
}

resource "azurerm_network_security_rule" "rules" {
  count                       = length(var.webnsg_rules_info)
  name                        = var.webnsg_rules_info[count.index].name
  resource_group_name         = azurerm_resource_group.ntier.name
  network_security_group_name = var.webnsg_rules_info[count.index].nsg_name
  protocol                    = var.webnsg_rules_info[count.index].protocol
  source_port_range           = var.webnsg_rules_info[count.index].source_port_range
  destination_port_range      = var.webnsg_rules_info[count.index].destination_port_range
  direction                   = var.webnsg_rules_info[count.index].direction
  source_address_prefix       = var.webnsg_rules_info[count.index].source_address_prefix
  destination_address_prefix  = var.webnsg_rules_info[count.index].destination_address_prefix
  access                      = var.webnsg_rules_info[count.index].access
  priority                    = var.webnsg_rules_info[count.index].priority
  depends_on                  = [azurerm_network_security_group.nsgs]
}



resource "azurerm_network_interface" "webnic" {
  name                = "webnic"
  resource_group_name = azurerm_resource_group.ntier.name
  location            = var.location
  ip_configuration {
    name = "web"
    //todo: need to change from static indexing to dynamic
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.webip.id
  }

}

resource "azurerm_network_interface" "businessnic" {
  name                = "businessnic"
  resource_group_name = azurerm_resource_group.ntier.name
  location            = var.location
  ip_configuration {
    name = "business"
    //todo: need to change from static indexing to dynamic
    subnet_id                     = azurerm_subnet.subnets[1].id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_network_interface" "datanic" {
  name                = "datanic"
  resource_group_name = azurerm_resource_group.ntier.name
  location            = var.location
  ip_configuration {
    name = "data"
    //todo: need to change from static indexing to dynamic
    subnet_id                     = azurerm_subnet.subnets[2].id
    private_ip_address_allocation = "Dynamic"
  }

  depends_on = [azurerm_subnet.subnets,
  azurerm_network_security_rule.rules]

}


resource "azurerm_network_interface_security_group_association" "web" {
  network_interface_id = azurerm_network_interface.webnic.id
  //todo: if possible replace with dynamic associations 
  network_security_group_id = azurerm_network_security_group.nsgs[0].id

}

resource "azurerm_network_interface_security_group_association" "business" {
  network_interface_id = azurerm_network_interface.businessnic.id
  //todo: if possible replace with dynamic associations 
  network_security_group_id = azurerm_network_security_group.nsgs[1].id
}

resource "azurerm_network_interface_security_group_association" "data" {
  network_interface_id = azurerm_network_interface.datanic.id
  //todo: if possible replace with dynamic associations 
  network_security_group_id = azurerm_network_security_group.nsgs[2].id
}

