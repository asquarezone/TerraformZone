variable "address_space" {
    type = string
    default = "192.168.0.0/16"
}

variable "location" {
    type = string
    default = "eastus"
}

variable "subnets" {
    type = list(string)
    default = [ "web", "app", "db" ]
  
}

variable "client_id" {
    type = string
  
}

variable "client_secret" {
    type = string
  
}
variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}

variable "username" {
    type = string
    default = "qtdevops"
}

variable "password" {
    type = string
  
}

variable "enable_vm" {
    description = "If set to true will create vm"
    type = bool
    default = false
  
}