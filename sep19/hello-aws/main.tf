provider "aws" {
  region        = "us-west-2"
  access_key    = "AKIA3TXJQGAJG2BRQ3R3"
  secret_key    = "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"
}

resource "aws_instance" "mywebserver" {
    ami         = "ami-06f2f779464715dc5"
    instance_type   = "t2.micro"
  
}

