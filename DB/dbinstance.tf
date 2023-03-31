resource "random_id" "db_name_suffix" {
  byte_length = 3
}


# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "mysql-from-terraform" {
  name                = "mysql-from-terraform-${random_id.db_name_suffix.hex}"
  region              = var.region
  project             = var.project_name
  database_version    = var.database_version
  deletion_protection = "false"
  root_password       = var.db_password

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled = "true"

      authorized_networks {
        value = var.authorized_networks
        name  = var.db_username

      }

      # location_preference {
      #   zone = var.zone
      # }
    }
  }
}

resource "google_sql_database" "database" {
  name     = var.db_name
  instance = google_sql_database_instance.mysql-from-terraform.name
}

resource "google_sql_user" "users" {
  name     = var.db_username
  instance = google_sql_database_instance.mysql-from-terraform.name
  host     = var.db_host
  password = var.db_password
}
