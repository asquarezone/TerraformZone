
provider "azurerm" {
    client_id = "${var.clientid}"
    subscription_id ="${var.subscriptionid}"
    tenant_id = "${var.tenantid}"
    client_secret ="${var.clientsecret}"
  
}

resource "azurerm_resource_group" "ntier" {
    name = "ntier"
    location = "Central Us"
    tags = {
        environment = "Development"
    }
}

