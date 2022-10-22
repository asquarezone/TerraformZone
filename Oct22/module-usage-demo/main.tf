module "myvnet" {
    source = "git::https://github.com/asquarezone/ntier-azure-vnet.git"
    resourcegroup_details = {
      location = "eastus"
      name = "ntier-rg"
    }
    vnet_details = {
      address_space = [ "10.10.0.0/16" ]
      name = "ntier"
    }
    subnet_details = {
        names = [ "web", "db" ]
    }
    
}

output "subnetcountfrommodule" {
    value = module.myvnet.subnetcount
}