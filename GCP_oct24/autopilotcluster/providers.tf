terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.8.0"
    }
  }
  backend "gcs" {
    bucket = "lt_terraform_backend"
    prefix = "autopilot/state"

  }
}

provider "google" {
  # Configuration options
  project = var.project

}