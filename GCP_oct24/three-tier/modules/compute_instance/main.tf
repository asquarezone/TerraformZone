resource "google_compute_instance" "base" {
  name         = var.instance_info.name
  machine_type = var.instance_info.machine_type
  zone         = var.instance_info.zone
  boot_disk {
    initialize_params {
      image = var.instance_info.image
    }
  }

  network_interface {
    network    = var.instance_info.network
    subnetwork = var.instance_info.subnet
  }

}