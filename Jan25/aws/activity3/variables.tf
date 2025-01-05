variable "region" {
  type        = string
  description = "Region"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
}

variable "network_name" {
  type        = string
  description = "name for reference"
  default     = "ntier"
}

variable "private_subnets" {
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  description = "private subnets"

}

variable "public_subnets" {
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  description = "private subnets"

}