resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "3306", "443", "22"]
  }

  source_tags = ["firewall-for-wordpress"]
  source_ranges =["0.0.0.0/0"]
}

