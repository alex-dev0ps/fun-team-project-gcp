# Vpc Creation
#resource "google_compute_network" "vpc" {
# project                 = var.project_id
# name                    = var.vpc_name
#  auto_create_subnetworks = "true"
#  routing_mode            = "GLOBAL"
#}


resource "google_compute_network" "private_network" {
  provider = google-beta

  name = "private-network"
}

resource "google_compute_global_address" "private_ip_address" {
  provider = google-beta

  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.private_network.id
}
