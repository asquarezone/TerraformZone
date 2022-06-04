module "ntier_azure" {
    source              = "./modules/ntier_azure"
    network_cidr        = ["192.168.0.0/16"]
    subnet_names        = ["web", "app", "cache", "db"]
    appsubnet           = "app"
    websubnet           = "web"
    servername          = "qt1dbfrommodule"
    dbname              = "qt1ecommerce"
    vmsize              = "Standard_B1s"
    username            = "qtdevops"
    password            = "motherindia@123"
    increment_execute   = "0"

}

output "webvm" {
    value = module.ntier_azure.webserver_url
  
}