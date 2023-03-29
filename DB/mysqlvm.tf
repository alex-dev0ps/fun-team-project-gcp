resource "random_id" "db_name_suffix" {
  byte_length = 3
}


# See versions at https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance#database_version
resource "google_sql_database_instance" "mysql-from-terraform" {
  name             = "mysql-from-terraform-${random_id.db_name_suffix.hex}"
  region           = var.region
  database_version = var.database_version
  settings {
    tier = "db-f1-micro"
  }
#after create resourse make sure disable data deletion protection manually if deletion protection is set to true
  deletion_protection  = "false"
  
  
}


