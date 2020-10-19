terraform {
  backend "s3" {
        bucket          = "qtforterraformstate"
        key             = "global/ntierwithmodule/terraform.tfstate"
        region          = "us-west-2"

        dynamodb_table  = "qttableforterraformlock"

  }
  
}
