provider "azurerm" {
    subscription_id = "${var.subscriptionid}"
    client_id       = "${var.clientid}"
    client_secret   = "${var.clientsecret}"
    tenant_id       = "${var.tenantid}"
}

resource "azurerm_resource_group" "dbresg" {
  name     = "database-rg"
  location = "Central US"
}

resource "azurerm_sql_server" "azuresqlserver" {
    name                            = "azurermsqlserver"
    resource_group_name             = "database-rg"
    location                        = "Central US"
    administrator_login             = "qtdevops"
    administrator_login_password    = "motherindia@123"
  
}


resource "azurerm_sql_database" "openmrsdb" {
    name            = "opemmrs"
    resource_group_name             = "database-rg"
    location                        = "Central US"
    server_name                     = "azurermsqlserver"
    
  
}


