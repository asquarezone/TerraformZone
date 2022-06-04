variable "network_cidr" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

variable "subnet_names" {
    type    = list(string)
    default = [ "web", "app", "db"  ]
}

variable "private_endpoint_subnet" {
    type    = string
    default = "db"
}

variable "appsubnet" {
    type = string
    default = "app"
}

variable "websubnet" {
    type = string
    default = "web"
}

variable "servername" {
    type = string
    default = "qt1dbservertf1"
}

variable "dbname" {
    type = string
    default = "qtdbfromtf1"
}

variable "vmsize" {
    type = string
    default = "Standard_B1s"
}

variable "username" {
    type = string
    default = "qtdevops"
  
}

variable "password" {
    type = string
    default = "motherindia@123"
  
}


variable "increment_execute" {
    type = string
    default = "0"
}