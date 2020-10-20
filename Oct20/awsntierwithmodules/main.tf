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
  source                = "./modules/rds_instance"
  vpc_id                = module.backupnetwork.primary_vpc_id
  providers             = {
      aws               = aws.west
  }
}

module appserver {
  source                = "./modules/ec2_instance"
  vpc_id                = module.backupnetwork.primary_vpc_id
  inline_scripts        = [
            "sudo apt update",
            "sudo apt install tomcat8 tomcat8-admin tomcat8-common tomcat8-docs tomcat8-examples -y",
            "cd /var/lib/tomcat8/webapps",
            "sudo wget https://referenceappkhaja.s3-us-west-2.amazonaws.com/gameoflife.war"
        ]
  providers             = {
      aws               = aws.west
  }
  tagname               = "appserver"
  subnet_id             = module.backupnetwork.subnets[5]

}

module webserver {
  source                = "./modules/ec2_instance"
  vpc_id                = module.backupnetwork.primary_vpc_id
  inline_scripts        = [
            "sudo apt update",
            "sudo apt install nginx -y"
        ]
  providers             = {
      aws               = aws.west
  }
  tagname               = "webserver"
  subnet_id             = module.backupnetwork.subnets[5]
  sgname                = "allow_web"

}

