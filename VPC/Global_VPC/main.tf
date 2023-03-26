resource "google_compute_network" "vpc" {         
     name = "fun-team-project-gpc"
     auto_create_subnetworks = "true"
     routing_mode = "GLOBAL"
 }
