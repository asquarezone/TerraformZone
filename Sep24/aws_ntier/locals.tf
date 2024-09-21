locals {
  do_we_have_public_subnets  = length(var.public_subnets) > 0
  do_we_have_private_subnets = length(var.private_subnets) > 0
  anywhere                   = "0.0.0.0/0"
}