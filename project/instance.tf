resource "google_sql_database_instance" "instance" {
  provider = google-beta

  name             = var.instance_name[count.index]
  region           = var.region
  database_version = var.database_version
  deletion_protection = false
  project = var.project_name

  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = google_compute_network.vpc.id
      enable_private_path_for_google_cloud_services = true
    }
  }

}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "users" {
  name     = var.username
  instance = google_sql_database_instance.instance.name
  host     = var.host
  password = var.user_password
}