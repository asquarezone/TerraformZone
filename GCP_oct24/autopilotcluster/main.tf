# Querying the provider to fetch the network information
data "google_compute_network" "selected" {
  name    = var.network
  project = var.project

}


resource "google_container_cluster" "base" {
  name             = var.cluster_name
  enable_autopilot = true
  location         = var.region
  network          = data.google_compute_network.selected.id
}