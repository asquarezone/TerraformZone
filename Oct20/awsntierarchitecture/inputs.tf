variable primary_region {
  type        = string
  default     = "us-west-2"
  description = "The primary region for deploying aws resources"
}

variable primary_network_cidr {
  type        = string
  default     = "10.10.0.0/16"
  description = "address range of primary"
}

variable primary_subnets {
  type        = list(string)
  default     = ["web", "app", "db", "mgmt", "web2", "app2", "db2"]
  description = "subnet names of the primary"
}

variable route_table_names {
  type        = list(string)
  default     = ["public", "private"]
  description = "Route tables for ntier subnet"
}

variable associations {
  type        = map

  default     = {
    public    = [ 0,3,4 ]
    private   = [ 1,2,5,6] 
  }
}




