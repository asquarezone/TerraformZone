variable "buckets" {
  type = list(object({
    name   = string
    region = string
  }))
  default = [{
    name   = "qttfstate1"
    region = "us-west-2"
    },
    {
      name   = "qttfstate2"
      region = "us-west-1"
    },
    {
      name   = "qttfstate3"
      region = "us-east-2"
  }]

}