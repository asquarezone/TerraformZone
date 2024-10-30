module "network" {
  source = "./modules/network"
  network_info = {
    name                = "threetier"
    auto_create_subnets = false
  }
  subnets = {
    "web" = {
      ip_cidr_range = "192.168.0.0/24"
      region        = "us-central1"
    },
    "app" = {
      ip_cidr_range = "192.168.1.0/24"
      region        = "us-central1"
    },
    "db" = {
      ip_cidr_range = "192.168.2.0/24"
      region        = "us-central1"
    }
  }

}

# open ssh firewall rule for instances with tag 'linux'
module "ssh_firewall" {
  source = "./modules/firewall"
  firewall = {
    name          = "opensshthreetier"
    description   = "openssh for linux connectivity"
    network       = module.network.network_id
    allow_ports   = ["22"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["linux"]
  }

  depends_on = [module.network]

}

# open http, https firewall rule for instances with tag 'web'

module "http_firewall" {
  source = "./modules/firewall"
  firewall = {
    name          = "openhttps"
    description   = "openhttps for linux connectivity"
    network       = module.network.network_id
    allow_ports   = ["80", "443"]
    source_ranges = ["0.0.0.0/0"]
    target_tags   = ["web"]
  }

  depends_on = [module.network]

}