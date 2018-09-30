provider "aws" {
    access_key = "AKIAIMJ6GMYHPIENQSIQ"
    secret_key = "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"
    region = "us-west-2"
}
#terraform init --backend-config="dynamodb_table=qt-tf-backend" --backend-config="access_key=AKIAIMJ6GMYHPIENQSIQ" --backend-config="secret_key=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"
terraform {
  backend "s3" {
    bucket = "qt-terraform-state"
    key    = "my-module-demo.state"
    region = "us-west-2"
    dynamodb_table = "qt-tf-backend"
  }
}

resource "aws_instance" "apache" {
    ami = "ami-6cd6f714"
    instance_type = "t2.micro"
  
}