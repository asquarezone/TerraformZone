### Defined variables

variable "primary_network_cidr" {
  type        = list(string)
  description = "This is primary networks cidr range"
  default     = ["192.168.0.0/16"]
}

variable "web_subnet_cidr" {
  type        = string
  description = "This is web subnet cidr"
  default     = "192.168.0.0/24"
}
variable "db_subnet_cidr" {
  type        = string
  description = "This is db subnet cidr"
  default     = "192.168.1.0/24"

}