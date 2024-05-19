variable "instance_info" {
  type = object({
    name                        = string
    size                        = string
    ami                         = string
    subnet_id                   = string
    security_group_id           = string
    key_name                    = string
    user_data                   = bool
    user_data_file              = string
    associate_public_ip_address = bool
  })

}
