variable "instance_info" {
  type = object({
    name         = string
    machine_type = optional(string, "e2-micro")
    image        = optional(string, "ubuntu-os-cloud/ubuntu-2204-lts")
    network      = string
    subnet       = string
    zone         = optional(string, "us-central1-f")
  })

}