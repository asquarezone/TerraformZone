

variable "network_info" {
  type = object({
    name                = string
    auto_create_subnets = bool
  })
  default = {
    name                = "ntier"
    auto_create_subnets = false
  }
}

variable "subnets" {
  type = map(object({
    ip_cidr_range = string
    region        = string
  }))
  default = {
    "web" = {
      ip_cidr_range = "192.168.0.0/24"
      region        = "us-central1"
    },
    "app" = {
      ip_cidr_range = "192.168.1.0/24"
      region        = "us-central1"
    },
    "db" = {
      ip_cidr_range = "192.168.2.0/24"
      region        = "us-central1"
    }
  }

}