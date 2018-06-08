module s3_backend {
  source                      = "youngfeldt/backend-s3/aws"
  backend_s3_bucket           = "qt-terraform-2"
  backend_dynamodb_lock_table = "multicloud-qt"
  create_dynamodb_lock_table  = true
  create_s3_bucket            = true
  s3_key                      = "multicloud.state"
}

terraform {
  backend "s3" {
    bucket = "qt-terraform-2"
    key    = "multicloud.state"
    region = "us-west-2"
  }
}

module "threetier" {
  source         = ".//Modules//Threetier"
  privatekeypath = "${var.privatekeypath}"
  accesskey      = "${var.aws_accesskey}"
  secretkey      = "${var.aws_secretkey}"
}

output "dbendpoint" {
  value = "${module.threetier.dbendpoint}"
}
