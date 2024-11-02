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

resource "null_resource" "kubectl" {
  triggers = {
    build_id = var.build_id
  }
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${var.cluster_name} --region ${var.region} --project ${var.project}"
  }

}

resource "null_resource" "deploy" {
  triggers = {
    deploy_id = var.deploy_id
  }

  provisioner "local-exec" {
    command = "kubectl apply -f deploy.yaml"
  }


}