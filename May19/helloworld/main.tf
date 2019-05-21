provider "aws" {
  region = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "hello" {
   ami = "ami-0de53d8956e8dcf80"
   key_name = "vpclearn"
   instance_type = "t2.micro"  
}

