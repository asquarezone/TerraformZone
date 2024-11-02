variable "cluster_name" {
  type        = string
  description = "cluster name"
}

variable "region" {
  type        = string
  description = "region of the cluster"

}

variable "project" {
  type        = string
  default     = "peak-responder-438809-q5"
  description = "project id"
}

variable "network" {
  type        = string
  description = "pass the network name"

}

variable "build_id" {
  type        = string
  description = "build id"
}

variable "deploy_id" {
  type        = string
  description = "deploy id"
  default     = "1"

}
