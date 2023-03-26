variable "region" {
  type        = string
  default     = "us-west-2"
  description = "Region to create resources"
}


variable "ntier_vpc_info" {
  type = object({
    vpc_cidr        = string,
    subnet_azs      = list(string),
    subnet_names    = list(string),
    private_subnets = list(string),
    public_subnets  = list(string)
  })
  default = {
    subnet_azs      = ["a", "b", "a", "b"]
    subnet_names    = ["app1", "app2", "db1", "db2"]
    vpc_cidr        = "192.168.0.0/16"
    public_subnets  = []
    private_subnets = ["app1", "app2", "db1", "db2"]
  }

}
