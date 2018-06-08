# use terraform init with backend config 
#terraform init --backend-config="dynamodb_table=qt-terraform" --backend-config="access_key=whatever" --backend-config="secret_key=whatever"
terraform {
  backend "s3" {
    bucket = "qt-terraform-backend-2"
    key    = "my-module-demo.state"
    region = "us-west-2"
    dynamodb_table = "qt-terraform-1"
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