provider "aws" {
    region      = "us-west-2"
    access_key  = "AKIAVEVSP5IYRHYSF35L"
    secret_key  = "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"
}

resource "aws_s3_bucket" "mybucket" {
    bucket      = "qts3fromtf"
    tags = {
    Name        = "My bucket"
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
}