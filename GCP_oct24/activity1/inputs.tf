variable "project" {
  type        = string
  default     = "peak-responder-438809-q5"
  description = "project id"
}

# variable "subnets" {
#   type = list(object({
#     name          = string
#     ip_cidr_range = string
#     region        = string
#   }))
# }

variable "subnets" {
  type = map(object({
    ip_cidr_range = string
    region        = string
  }))

}

variable "openssh_rule_to_be_applied" {
  type        = bool
  description = "whether to open ssh rule"

}
