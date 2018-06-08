
# Configure the AWS Provider
provider "aws" {
  access_key = "AKIAJ37E7PEKYUQRRDCA"
  secret_key = "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"
  region     = "us-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-056991673d41aa280"
  instance_type = "t2.micro"

  tags {
    Name = "HelloWorld"
  }
}