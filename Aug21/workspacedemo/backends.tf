terraform {
  backend "s3" {
      bucket = "qtforterraformstate"
      key = "ntier/ntier_state"
      region = "us-west-2"
      dynamodb_table = "forterraform"
    
  }
}