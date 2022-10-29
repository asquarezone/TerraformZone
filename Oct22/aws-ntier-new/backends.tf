terraform {
  backend "s3" {
        bucket = "thisisforterraform"
        key = "ntierdeploydev"
        region = "us-west-2"
        dynamodb_table = "thisisforteraform"
    
  }
}