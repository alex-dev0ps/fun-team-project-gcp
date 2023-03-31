resource "google_sql_database" "database" {
  name     = var.dbname
  instance = google_sql_database_instance.wordpress.name
}