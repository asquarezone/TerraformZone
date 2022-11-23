variable "public_provisoner_trigger" {
    type = string
    default = "1.1"
  
}

variable "private_provisoner_trigger" {
    type = string
    default = "1.1"
  
}

variable "public_machine_ip" {
    type = string
    default = "20.124.93.131"
  
}

variable "private_machine_ip" {
    type = string
    default = "10.0.1.4"
  
}

variable "username" {
    type = string
    default = "Dell"
}

variable "ssh_key_path" {
    type = string
    default = "~/.ssh/id_rsa"
  
}