variable "vpc_network_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "This is network cidr"
}

variable "web1_subnet_cidr" {
  type        = string
  default     = "10.10.0.0/24"
  description = "This is web1 subnet cidr"

}