resource "google_compute_network" "my_network" {
  name = "my-network"
}

resource "google_compute_subnetwork" "my_subnetwork" {
  name          = "my-subnetwork"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.my_network.id
  region        = "us-central1"
}



resource "google_compute_http_health_check" "my_health_check" {
  name               = "my-health-check"
  request_path       = "/"
  port               = 80
  check_interval_sec = 1
  timeout_sec        = 1
}


resource "google_compute_backend_service" "my_backend_service" {
  name                  = "my-backend-service"
  backend {
    group = google_compute_instance_group_manager.default.self_link
  }

  health_checks = [google_compute_http_health_check.my_health_check.id]
  protocol      = "HTTP"

}

resource "google_compute_forwarding_rule" "my_forwarding_rule" {
  name                  = "my-forwarding-rule"
  load_balancing_scheme = "EXTERNAL"
  #ip_address            = "x.x.x.x"
  ip_protocol           = "TCP"
  port_range            = "80,443"
  backend_service       = google_compute_backend_service.my_backend_service.self_link
}