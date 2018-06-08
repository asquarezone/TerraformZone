variable "accesskey" {}
variable  "secretkey" {}
variable "securitygroups" {
    type = "list"
    default = ["AllTCP"]
}
variable "private_key_path" {
    default = "packer.pem"
}
variable "homepagepath" {
    default = "index.html"
}