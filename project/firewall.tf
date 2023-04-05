resource "google_compute_firewall" "allow-traffic" {
  name    = var.firewall
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3306", "443"]
  }

  source_tags   = ["fun-gcp-firewall"]
  source_ranges = ["0.0.0.0/0"]
}