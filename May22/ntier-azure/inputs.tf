variable "network_cidr" {
    type    = list(string)
    default = ["10.0.0.0/16"]
}

variable "subnet_names" {
    type    = list(string)
    default = [ "web1", "web2", "app1", "app2", "db1", "db2"  ]
}