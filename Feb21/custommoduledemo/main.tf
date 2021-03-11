provider "aws" {
    region = "us-west-2"
}

provider "null" {

}

module "vpc" {
    source = "./modules/vpc"
    region = "us-west-2"
    
}

module "rds" {
    source = "./modules/rds"
    db1subnetid = module.vpc.db1subnetid
    db2subnetid = module.vpc.db2subnetid
    dbsgid = module.vpc.dbsgid
    
}

module "ec2" {
    source = "./modules/ec2"
    appsgid = module.vpc.appsgid
    app1subnetid = module.vpc.app1subnetid
    websgid = module.vpc.websgid
    web1subnetid = module.vpc.web1subnetid

}