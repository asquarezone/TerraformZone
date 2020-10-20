module network {
  source = "./modules/network"
  primary_network_cidr = "10.100.0.0/16"
}

module backupnetwork {
  source                = "./modules/network"
  primary_network_cidr  = "10.101.0.0/16"
  providers             = {
      aws               = aws.west
  }
}


module secondarydb {
  source = "./modules/rds_instance"
  vpc_id  = module.backupnetwork.primary_vpc_id
  providers             = {
      aws               = aws.west
  }
}

