project = "peak-responder-438809-q5"
web_subnet = {
  name          = "web"
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
}

db_subnet = {
  name          = "db"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
}