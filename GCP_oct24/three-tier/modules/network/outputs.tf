output "network_id" {
  value = google_compute_network.base.id
}

output "subnets" {
  value = google_compute_subnetwork.subnets
}