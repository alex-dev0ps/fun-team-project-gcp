# locals {
# project = "fun-team-project-gcp"
# region = "us-central1"
# }

provider "google" {
  region = var.region
  zone   = var.zone

}