# locals {
# project = "fun-team-project-gcp"
# region = "us-central1"
# }



provider "google" {
  project = var.project_name
  region  = var.region
  zone    = var.zone

}