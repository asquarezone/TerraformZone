resourcegroup_details = {
    name="ntier_rg" 
    location="eastus"
}

vnet_details = {
  address_space = [ "192.168.0.0/16" ]
  name = "ntier_vnet"
}

subnet_details = {
  names = [ "web", "app", "cache", "mgmt","ad","db" ]
}

runningversion = "1.0"