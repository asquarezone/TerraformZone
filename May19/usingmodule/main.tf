terraform {
  backend  "azurerm" {
    storage_account_name  = "tstate09762"
    container_name        = "tstate"
    key                   = "terraform.tfstate"

  }
}



module "azure_ntier" {
   source = "./modules/azure_ntier"
  
   subscriptionid = "${var.subscriptionid}"
   tenantid = "${var.tenantid}"
   clientsecret ="${var.clientsecret}"
   clientid = "${var.clientid}" 
}

module "apacheserver" {
  source = "./modules/apacheserver"
  accesskey = "${var.accesskey}"
  secretkey = "${var.secretkey}"
  
}


output "azurewebserverip" {
  value = "${module.azure_ntier.webserverip}"
}

output "awswebserverip" {
  value = "${module.apacheserver.apacheip}"
}


