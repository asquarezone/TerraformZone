variable "resourcegroup_details" {
    type = object({
            name=string
            location=string
            })
    default = {
      location = "eastus"
      name = "ntier"
    }
}

variable "vnet_details" {
    type = object({
        name=string
        address_space=list(string)
        
    })
    description = "(optional) describe your variable"
}