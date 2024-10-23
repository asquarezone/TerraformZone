terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "peak-responder-438809-q5"
  
}

resource "google_compute_network" "ntier" {
  name = "ntier"

}