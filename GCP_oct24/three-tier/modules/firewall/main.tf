resource "google_compute_firewall" "base" {
    name = var.firewall.name
    network = var.firewall.network
    description = var.firewall.description
    direction = var.firewall.direction
    allow {
      protocol = var.firewall.allow_protocol
      ports = var.firewall.allow_ports
    }
    source_ranges = var.firewall.source_ranges
    target_tags = var.firewall.target_tags
  
}