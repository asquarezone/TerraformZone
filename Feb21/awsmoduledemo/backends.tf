terraform {
  backend "s3" {
      bucket = "forterraform"
      key = "environments/terraform.tfstate"
      region = "us-west-2"
      dynamodb_table = "qtterraformlocks"

      workspaces {
          prefix = "lt-eapp-"
      }
    
  }
}