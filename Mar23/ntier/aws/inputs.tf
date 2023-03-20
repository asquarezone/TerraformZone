variable "region" {
  type        = string
  default     = "us-west-2"
  description = "Region to create resources"
}

variable "ntier-vpc-range" {
  type        = string
  default     = "192.168.0.0/16"
  description = "VPC Cidr Range"
}

variable "ntier-subnet-cidrs" {
  type    = list(string)
  default = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}

variable "ntier-subnet-azs" {
  type    = list(string)
  default = ["a", "b", "a", "b"]

}

variable "ntier-subnet-names" {
  type    = list(string)
  default = ["app1", "app2", "db1", "db2"]

}
