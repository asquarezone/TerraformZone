variable "region" {
    type    = string
    default = "ap-southeast-1"
}

variable "network_cidr" {
    type    = string
    default = "10.0.0.0/16"
  
}

variable "subnet_name_tags" {
    type    = list(string)
    default = [ "web1", "web2", "app1", "app2", "db1", "db2"  ]
  
}

variable "bucket_name" {
    type    = string
    default = "qts3khajatf3example1"
  
}