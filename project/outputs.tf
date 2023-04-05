output "vpc_id" {
  value = "google_compute_network.vpc.id"
}

output "name_of_vpc" {
  value = google_compute_network.vpc.name

}

output "database_user" {
  value = google_sql_user.users.name
}

output "target-pool-name" {
  value = google_compute_target_pool.target_pool.name
}