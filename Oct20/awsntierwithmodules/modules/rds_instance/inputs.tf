variable vpc_id {
  type        = string
  description = "The vpc id of the network"
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
