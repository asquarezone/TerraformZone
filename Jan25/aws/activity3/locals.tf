locals {
  anywhere             = "0.0.0.0/0"
  public_subnet_count  = length(var.public_subnets)
  private_subnet_count = length(var.private_subnets)
}