terraform {
  backend "s3" {
        bucket          = "qtforterraformstate"
        key             = "global/workspacedemo/terraform.tfstate"
        region          = "us-west-2"

        dynamodb_table  = "qttableforterraformlock"

  }
  
}
