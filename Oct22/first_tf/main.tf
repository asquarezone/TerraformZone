# This is the aws provider
provider "aws" {
 	region = "ap-south-1"
    access_key = "<your access key>"
    secret_key = "<your secret key>"
}


# This is the s3 bucket resource
resource "aws_s3_bucket" "first_bucket"  {
    bucket = "qttfoct12"
    tags = {
            Name        = "My bucket from tf"
            Environment = "Dev1"
    }
}

