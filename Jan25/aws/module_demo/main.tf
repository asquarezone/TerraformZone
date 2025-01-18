module "myvpc" {
  source       = "./modules/vpc"
  vpc_cidr     = "192.168.0.0/16"
  network_name = "vpc-module"
  private_subnets = [{
    name = "app"
    cidr = "192.168.0.0/24"
    az   = "ap-south-1a"
  }]
  public_subnets = [{
    name = "web"
    cidr = "192.168.1.0/24"
    az   = "ap-south-1a"
  }]

}
output "vpcid" {
  value = module.myvpc.vpc_id
}