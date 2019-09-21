# write a provider
provider "aws" {
    access_key = "${var.accesskey}"
    secret_key = "${var.secretkey}"
    region = "${var.region}"
  
}

module s3_backend {
  source                      = "youngfeldt/backend-s3/aws"
  version                     = ">= 1.0.0"
  backend_s3_bucket           = "qtterraformstatestorage"
  backend_dynamodb_lock_table = "qtterraformstatelock"
  create_dynamodb_lock_table  = true
  create_s3_bucket            = true
  s3_key                      = "backenddemo"
}



# use the module to create s3 bucket & dynamo db