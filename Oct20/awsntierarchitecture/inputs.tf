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

variable mysql_version {
  type        = string
  default     = "8.0.20"
  description = "version of my sql"
}

variable rds_instance_class {
  type        = string
  default     = "db.t2.micro"
  description = "size of the database"
}

variable is_rds_multi_az {
  type        = bool
  default     = false
  description = "Is multi az required"

}

variable dbname {
  type        = string
  default     = "lthrms"
  description = "name of the database"
}

variable primary_db_identifier {
  type        = string
  default     = "lt-ntier-primary"
  description = "identifier of primary db instance"
}

variable appserver_instance_type {
  type        = string
  default     = "t2.micro"
  description = "size of appserver"
}

variable key_name {
  type        = string
  default     = "awsclassroom"
  description = "aws key pair name"
}

variable ubuntu_18_ami {
  type        = string
  default     = "ami-07a29e5e945228fa1"
  description = "ami id of ubuntu instance"

}










