variable "project" {
  type        = string
  default     = "peak-responder-438809-q5"
  description = "project id"
}

variable "web_subnet" {
  type = object({
    name          = string
    ip_cidr_range = string
    region        = string
  })
  description = "subnet values"
  default = {
    name          = "web"
    ip_cidr_range = "10.0.0.0/24"
    region        = "us-central1"
  }

}

variable "db_subnet" {
  type = object({
    name          = string
    ip_cidr_range = string
    region        = string
  })
  description = "subnet values"
  default = {
    name          = "db"
    ip_cidr_range = "10.0.1.0/24"
    region        = "us-central1"
  }

}