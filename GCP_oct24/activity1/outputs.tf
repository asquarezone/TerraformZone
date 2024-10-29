output "network_id" {
  value = google_compute_network.base.id
}

output "subnet_cidrs" {
  value = {
    for name, response in google_compute_subnetwork.subnets : name => response.ip_cidr_range
  }

}