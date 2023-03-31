resource "google_compute_network" "vpc" {
  name                    = "vpc-fun-team-project-gcp"
  auto_create_subnetworks = "true"
  routing_mode            = "GLOBAL"
}

#creating an private VPC_peering connection
resource "google_compute_global_address" "private_ip_address" {
  provider = google-beta

  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc.id
}