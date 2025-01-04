variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "variable for a region in aws"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.100.0.0/16"
  description = "variable for network range"
}

variable "subnet_cidrs" {
  type        = list(string)
  default     = ["10.100.0.0/24", "10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]
  description = "cidr ranges of subnets"

}

variable "subnet_azs" {
  type    = list(string)
  default = ["ap-south-1a", "ap-south-1b", "ap-south-1a", "ap-south-1b"]

}
