provider "aws" {
   region       = "${var.region}"
   access_key   = "${var.accesskey}"
   secret_key   = "${var.secretkey}"
}

module "tomcatinaws" {
  source = "./modules/aws-tomcat"
  region = "${var.region}"
  
}

