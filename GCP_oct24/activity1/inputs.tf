variable "project" {
  type        = string
  default     = "peak-responder-438809-q5"
  description = "project id"
}

variable "subnets" {
  type = list(object({
    name          = string
    ip_cidr_range = string
    region        = string
  }))
}
