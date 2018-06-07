#terraform init --backend-config="dynamodb_table=qt-terraform" --backend-config="access_key=whatever" --backend-config="secret_key=whatever"
# Create Dynamo db table with LockID key with string type

#For automated s3 backend use the following module

module s3_backend {
  source                      = "youngfeldt/backend-s3/aws"
  version                     = ">= 1.0.0"
  backend_s3_bucket           = "${var.s3bucket}"
  backend_dynamodb_lock_table = "${var.dynamodb}"
  create_dynamodb_lock_table  = true
  create_s3_bucket            = true
  s3_key                      = "${var.s3key}"
}

terraform {
  backend "s3" {
    bucket = "${var.s3bucket}"
    key    = "${var.s3key}"
    region = "us-west-2"
  }
}

module "myazure" {
  source         = ".//myazure"
  clientid       = "${var.clientid}"
  password       = "${var.password}"
  tenantid       = "${var.tenantid}"
  subscriptionid = "${var.subscriptionid}"
}

output "ipaddress" {
  value = "${module.myazure.public_ip_address}"
}
