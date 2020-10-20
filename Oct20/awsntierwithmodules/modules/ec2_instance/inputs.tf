variable vpc_id {
  type        = string
  description = "vpc id of the ec2"
}

variable subnet_id {
  type        = string
  description = "subnet-id of the ec2"
}

variable tagname {
  type        = string
  default     = "server"
  description = "tag for the ec2"
}

variable inline_scripts {
  type        = list(string)
  description = "scripts to be executed"
}

variable instance_type {
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



