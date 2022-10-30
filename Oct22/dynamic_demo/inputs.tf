variable "subnets" {
    type = list(object({
        name = string
        address_prefix = string
    }))
    default = [ {
      address_prefix = "10.10.0.0/24"
      name = "web"
    },
    {
      address_prefix = "10.10.1.0/24"
      name = "app"
    },
    {
      address_prefix = "10.10.2.0/24"
      name = "db"
    }
     ]
}