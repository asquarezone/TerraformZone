resource_group = {
  name     = "ntier"
  location = "eastus"
}
vnet_address_space = "10.0.0.0/16"
subnets = [{
  name          = "web"
  address_space = "10.0.0.0/24"
  }, {
  name          = "app"
  address_space = "10.0.1.0/24"
  }, {
  name          = "db"
  address_space = "10.0.2.0/24"
}]
