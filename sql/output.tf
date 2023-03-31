output "vpc_id" {
  value = "google_compute_network.vpc.id"
}

output "private_ip" {
  value = "google_sql_database_instance.wordpress.private_ip_address"
}
