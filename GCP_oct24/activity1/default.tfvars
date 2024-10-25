project = "peak-responder-438809-q5"
# subnets = [{
#   name          = "web"
#   ip_cidr_range = "10.0.0.0/24"
#   region        = "us-central1"
#   }, {
#   name          = "db"
#   ip_cidr_range = "10.0.1.0/24"
#   region        = "us-central1"
# }]

subnets = {
  "web" = {
    ip_cidr_range = "10.0.0.0/24"
    region        = "us-central1"
  },
  "app" = {
    ip_cidr_range = "10.0.1.0/24"
    region        = "us-central1"
  },
  "db" = {
    ip_cidr_range = "10.0.2.0/24"
    region        = "us-central1"
  }
}
