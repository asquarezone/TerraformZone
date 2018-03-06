terraform {
  backend "s3" {
    bucket = "qt-terraform-backend-1"
    key    = "my-module-demo.state"
    region = "us-west-2"
  }
}

module "web" {
    source = ".//Modules/web"
    aws_access_key = "${var.accesskey}"
    aws_secret_key ="${var.secretkey}"
    security_groups = "${var.securitygroups}"
    private_key_path = "${var.private_key_path}"
    homepagepath = "${var.homepagepath}"
}

output "url" {
    value = "${module.web.ipaddress}"
}