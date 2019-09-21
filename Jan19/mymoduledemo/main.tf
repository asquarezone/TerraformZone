variable "accesskey" {
    type = "string"
  
}

variable "secretkey" {
    type = "string"
  
}


module "mymodule" {
  source = "./modules/mymodule"
  
  myaccesskey = "${var.accesskey}"
  mysecretkey ="${var.secretkey}"
}


output "eip address" {
  value = "${module.mymodule.elasticipaddress}"
}
