variable "region" {
    type        = string
    description = "(optional) region where the resources will be created"
    default     = "us-west-2"
}

variable "cidr_block" {
    type        = string
    default     = "192.168.0.0/16"
}

variable "subnet_cidrs" {
    type        = list(string)
}

variable "subnet_name_tags" {
    type        = list(string)
  
}