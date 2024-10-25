resource "google_compute_network" "base" {
  name                    = "activity1"
  auto_create_subnetworks = false

}

resource "google_compute_subnetwork" "web" {
  name          = "web"
  network       = google_compute_network.base.id # internal dependency
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
  depends_on = [
    google_compute_network.base
  ]

}


resource "google_compute_subnetwork" "db" {
  name          = "db"
  network       = google_compute_network.base.id
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  depends_on = [
    google_compute_network.base
  ]

}



