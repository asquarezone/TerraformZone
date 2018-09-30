provider "aws" {
  access_key = "AKIAIH524E5KGVKCZSIQ"
  secret_key = "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"
  region = "us-west-2"
}

data "aws_security_group" "mysgs" {
  vpc_id = "vpc-b76f25cf"
}


resource "aws_instance" "apache" {
    ami = "ami-0ec2b1175747b5db9"
    instance_type = "t2.micro"
    security_groups = "${data.aws_security_group.mysgs.id}"
  
}

