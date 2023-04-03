resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc-network-team3.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "3306", "443", "22"]
  }

  source_tags = ["wordpress-firewall"]
  source_ranges =["0.0.0.0/0"]
}

