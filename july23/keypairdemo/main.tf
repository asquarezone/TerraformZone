terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
  }
}

provider "tls" {
  # Configuration options
}

resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

output "private_key" {
  value     = tls_private_key.my_key.private_key_openssh
  sensitive = true
}

output "public_key" {
  value     = tls_private_key.my_key.public_key_openssh
  sensitive = true

}