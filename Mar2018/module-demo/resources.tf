variable "myaccess" {}
variable "mysecret" {}

terraform {
  backend "s3" {
    bucket = "qt-terraform-backend-1"
    key    = "classroom-demo.state"
    region = "us-west-2"
    
  }
}


module "web" {
    source = ".//Modules/web"
    access = "${var.myaccess}" 
    secret = "${var.mysecret}"
}

output "moduleip" {
    value = "${module.web.ip}"
}

output "moduledns" {
    value = "${module.web.hostname}"
}