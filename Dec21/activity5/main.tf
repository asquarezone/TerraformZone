module "awsntier" {
    source          = "./modules/awsntier"
    vpc_cidr        = var.vpc_cidr
    instance_type   = var.instance_type
    subnet_cidrs    = var.subnet_cidrs
    subnet_azs      = var.subnet_azs
    subnet_names    = var.subnet_names
    
}

module "azurentier" {
    source          = "./modules/azurentier"
    vnet_range      = var.vnet_range
    region          = var.region
    subnet_names    = var.subnet_names
    build_id        = var.build_id
    create_db       = var.create_db
    
}

output "awswebip" {
    value = module.awsntier.web1_publicip
  
}

output "azurewebip" {
   value = module.azurentier.azure_publicip
}