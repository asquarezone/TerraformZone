# required variable accesskey
variable "accesskey" {
    type = "string"
}

# required variable secretkey
variable "secretkey" {
    type = "string"
}

# optional region
variable "region" {
    type = "string"
    default = "eu-west-3"
}