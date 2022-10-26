variable "region" {
    type = string
    description = "region of vpc"
    default = "us-west-2"
}

variable "vpc-name" {
    type = string
    description = "name of the vpc"
}

variable "vpc-cidr" {
    type = string
    description = "cidr range of vpc"
}

variable "private-cidrs" {
    type = list(string)
}

variable "public-cidrs" {
    type = list(string)
}