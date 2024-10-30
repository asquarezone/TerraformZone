variable "firewall" {
   type = object({
     name = string
     description = optional(string, null)
     direction = optional(string, "INGRESS")
     network = string
     allow_protocol = optional(string, "tcp")
     allow_ports = list(string)
     source_ranges = optional(list(string), [])
     target_tags = list(string)
   })
   default = {
     name = "openssh"
     description = "openssh for linux connectivity"
     network = "<your id>"
     allow_ports = [ "22" ]
     source_ranges = [ "0.0.0.0/0" ]
     target_tags = [ "linux" ]
   }
  
}