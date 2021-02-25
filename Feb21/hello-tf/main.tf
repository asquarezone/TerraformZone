provider "aws" {
   region   = "ap-south-1"
   access_key = "your access key"
   secret_key = "your secret key"
}

resource "aws_s3_bucket" "mybucket" {
    bucket = "qts3fromtffeb21"
}

