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

module "webserver" {
    source = "./modules/compute_instance"
    instance_info = {
        name = "web1"
        machine_type = "e2-small"
        network = module.network.network_id
        subnet = module.network.subnets["web"].id
        zone = "us-central1-f"
      
    }
  
}

module "mysql-db" {
  source  = "terraform-google-modules/sql-db/google//modules/mysql"
  version = "~> 23.0"

  name                 = "threetier-db"
  random_instance_name = true
  database_version     = "MYSQL_5_6"
  project_id           = var.project
  zone                 = "us-central1-f"
  region               = "us-central1"
  tier                 = "db-n1-standard-1"

  deletion_protection = false

  ip_configuration = {
    ipv4_enabled        = true
    private_network     = null
    ssl_mode            = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
    allocated_ip_range  = null
  }


  database_flags = [
    {
      name  = "log_bin_trust_function_creators"
      value = "on"
    },
  ]
}