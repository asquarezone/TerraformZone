variable "webserverinstancetype" {
  type = string
  default = "t2.micro"
  description = "web server instance type"
  
}

variable "appsgid" {
    type = string
    description = "app sg id"
}

variable "app1subnetid" {
    type = string
    description = "app1 subnet id"
}

variable "websgid" {
    type = string
    description = "web sg id"
}

variable "web1subnetid" {
    type = string
    description = "web1 subnet id"
}
