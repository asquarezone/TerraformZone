region   = "ap-south-1"
vpc_cidr = "192.168.0.0/16"
subnet_cidrs = [
  "192.168.0.0/24",
  "192.168.1.0/24",
  "192.168.2.0/24",
  "192.168.3.0/24",
  "192.168.4.0/24",
  "192.168.5.0/24"
]
subnet_azs = [
  "ap-south-1a",
  "ap-south-1b",
  "ap-south-1a",
  "ap-south-1b",
  "ap-south-1a",
  "ap-south-1b"
]
subnet_names = [
  "web-1",
  "web-2",
  "app-1",
  "app-2",
  "db-1",
  "db-2"
]