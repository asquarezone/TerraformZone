### Defined variables

variable "primary_network_cidr" {
  type        = string
  description = "This is primary networks cidr range"
  default     = "192.168.0.0/16"
}

variable "subnet_names" {
  type        = list(string)
  default     = ["web", "app", "db"]
  description = "subnet names"

}

variable "subnet_cidrs" {
  type        = list(string)
  default     = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
  description = "subnet cidrs"
}

variable "subnet_azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1a", "ap-south-1a"]

}
