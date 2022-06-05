terraform {
  backend "s3" {
      bucket = "qts3tfstates"
      key = "awss3backenddemo.tfstate"
      region = "us-west-2"
      dynamodb_table = "forterraform"
  }
}