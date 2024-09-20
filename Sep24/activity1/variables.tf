variable "vpc_config" {
  type = object({
    cidr_block = string
    tags       = map(string)
  })
  description = "this is vpc info"
  default = {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name    = "terraform"
      Env     = "Dev"
      Project = "Learning"
    }
  }
}

variable "subnets_config" {
  type = list(object({
    cidr_block        = string
    availability_zone = string
    tags              = map(string)
  }))
  description = "subnets configuration"
  default = [{
    cidr_block = "10.0.0.0/24"
    tags = {
      Name    = "web-1"
      Env     = "Dev"
      Project = "Learning"
    }
    availability_zone = "ap-south-1a"
    }, {
    cidr_block = "10.0.1.0/24"
    tags = {
      Name    = "web-2"
      Env     = "Dev"
      Project = "Learning"
    }
    availability_zone = "ap-south-1b"
    }, {
    cidr_block = "10.0.2.0/24"
    tags = {
      Name    = "db-1"
      Env     = "Dev"
      Project = "Learning"
    }
    availability_zone = "ap-south-1a"
    }, {
    cidr_block = "10.0.3.0/24"
    tags = {
      Name    = "db-2"
      Env     = "Dev"
      Project = "Learning"
    }
    availability_zone = "ap-south-1b"
    }
  ]

}
