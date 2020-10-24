variable client_id {
  type        = string
  default     = ""
  description = "client id of azure"
}

variable     subscription_id {
  type        = string
  default     = ""
  description = "subscription id of azure"
}

variable client_secret {
  type        = string
  default     = ""
  description = "client_secret of azure"
}

variable tenant_id {
  type        = string
  default     = ""
  description = "tenant_id"
}

variable address_space {
  type        = string
  default     = "10.0.0.0/16"
  description = "cidr range of network"
}

variable subnets {
  type        = list(string)
  default     = ["appgateway", "management", "webtier", "businesstier", "datatier", "activedirectory"]
  description = "subnets"
}





