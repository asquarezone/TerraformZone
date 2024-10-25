resource "google_compute_network" "base" {
  name                    = "activity1"
  auto_create_subnetworks = false

}

resource "google_compute_subnetwork" "web" {
  name          = var.web_subnet.name
  network       = google_compute_network.base.id # internal dependency
  ip_cidr_range = var.web_subnet.ip_cidr_range
  region        = var.web_subnet.region
  depends_on = [
    google_compute_network.base
  ]

}


resource "google_compute_subnetwork" "db" {
  name          = var.db_subnet.name
  network       = google_compute_network.base.id
  ip_cidr_range = var.db_subnet.ip_cidr_range
  region        = var.db_subnet.region
  depends_on = [
    google_compute_network.base
  ]

}



