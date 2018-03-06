variable "accesskey" {}
variable  "secretkey" {}
variable "securitygroups" {
    type = "list"
    default = ["AllTCP"]
}
variable "private_key_path" {
    default = ".//Modules/web/terraform.pem"
}
variable "homepagepath" {
    default = "index.html"
}