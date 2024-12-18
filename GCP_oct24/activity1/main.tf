resource "google_compute_network" "base" {
  name                    = "activity1"
  auto_create_subnetworks = false

}

# resource "google_compute_subnetwork" "subnets" {
#   count         = length(var.subnets)
#   name          = var.subnets[count.index].name
#   network       = google_compute_network.base.id # internal dependency
#   ip_cidr_range = var.subnets[count.index].ip_cidr_range
#   region        = var.subnets[count.index].region
#   depends_on = [
#     google_compute_network.base
#   ]

# }

resource "google_compute_subnetwork" "subnets" {
  for_each      = var.subnets
  name          = each.key
  network       = google_compute_network.base.id
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  depends_on    = [google_compute_network.base]
}

# open ssh firewall rule

resource "google_compute_firewall" "ssh" {
  count       = var.openssh_rule_to_be_applied ? 1 : 0
  name        = "openssh"
  network     = google_compute_network.base.id
  description = "this rule opens 22 port from anywhere"
  allow {
    protocol = local.tcp
    ports    = [local.ssh_port_number]
  }
  source_ranges = [local.anywhere]
  target_tags   = ["linux"]
  depends_on    = [google_compute_network.base]

}


resource "google_compute_firewall" "web" {
  description = "open web"
  name        = "web"
  network     = google_compute_network.base.id
  source_ranges = [
    local.anywhere,
  ]
  target_tags = [
    "web",
  ]

  allow {
    ports = [
      local.http_port_number,
    ]
    protocol = local.tcp
  }
}



