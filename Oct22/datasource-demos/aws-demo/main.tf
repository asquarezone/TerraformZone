data "aws_vpc" "default" {
    default = true
}

data "aws_subnets" "subnetids" {
    filter {
      name = "availability-zone"
      values = [ "ap-south-1a" ]
    }

  
}

data "azurerm_resources" "allresources" {
    type = "Microsoft.Network/virtualNetworks"
}

output "defaultvpcid" {
    value = data.aws_vpc.default.id
}

output "subnetids" {
    value = data.aws_subnets.subnetids.ids
}

output "vnets-count" {
    value = length(data.azurerm_resources.allresources.resources)
  
}