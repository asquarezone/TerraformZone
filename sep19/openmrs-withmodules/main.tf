provider "aws" {
   region       = "${var.region}"
   access_key   = "${var.accesskey}"
   secret_key   = "${var.secretkey}"
}

module s3_backend {
  source                      = "youngfeldt/backend-s3/aws"
  version                     = ">= 1.0.0"
  backend_s3_bucket           = "qts3terraformclassroom"
  backend_dynamodb_lock_table = "qtdyanmodblockingtf"
  create_dynamodb_lock_table  = true
  create_s3_bucket            = false
  s3_key                      = "openmrs/deploy"
}

module "tomcatinaws" {
  source    = "./modules/aws-tomcat"
  region    = "eu-west-3"
  
}

terraform {
    backend "s3"{
        bucket = "qts3terraformclassroom"
        key = "openmrs-deploy"
        region = "eu-west-3"
    }
}