# Create a new network

resource "google_compute_network" "base" {
  name                    = var.network_info.name
  auto_create_subnetworks = var.network_info.auto_create_subnets
}

# create subnets 

resource "google_compute_subnetwork" "subnets" {
  for_each      = var.subnets
  name          = each.key
  network       = google_compute_network.base.id
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  depends_on    = [google_compute_network.base]
}
