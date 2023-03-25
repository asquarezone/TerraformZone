location     = "eastus"
vnet_range   = ["10.0.0.0/16"]
subnet_names = ["app", "db"]
network_interface_info = {
  ip_allocation_method = "Dynamic"
  ip_name              = "appserverip"
  name                 = "appservernic"
  subnet_index         = 0
}