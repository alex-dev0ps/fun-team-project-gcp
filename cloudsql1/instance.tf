# Vpc Creation
resource "google_compute_network" "vpc" {
  
name                    = var.name
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

resource "google_service_networking_connection" "private_vpc_connection" {
  provider = google-beta

  network                 = google_compute_network.vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}


# Creating a SQL Data Base version 2019 thet depends on private ip
resource "google_sql_database_instance" "wordpress" {
  name             = var.instance_name
  database_version = var.database_version

  depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    /* Second-generation instance tiers are based on the machine
     type. See argument reference below.*/
    tier = var.tier
    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = google_compute_network.vpc.id
      enable_private_path_for_google_cloud_services = true
    }

  }
}


