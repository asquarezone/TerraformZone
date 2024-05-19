resource "azurerm_resource_group" "ntier" {
  name     = "ntier"
  location = "East US"

}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  version             = "4.1.0"
  vnet_location       = azurerm_resource_group.ntier.location
  resource_group_name = azurerm_resource_group.ntier.name
  subnet_names        = ["web", "app", "db"]
  subnet_prefixes     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
  address_space       = ["10.0.0.0/16"]
  vnet_name           = "ntier"
  use_for_each        = true
  depends_on = [
    azurerm_resource_group.ntier
  ]

}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"
  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

