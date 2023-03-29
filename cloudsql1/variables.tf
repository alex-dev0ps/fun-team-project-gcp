variable "region" {
  default = "us-central1"
}

variable "instance_name" {
  default = "wordpress"
}

variable "database_version" {
  default = "MySQL_8.0"
}

variable "tier" {
  default = "db-f1-micro"
}

variable "dbname" {
    default = "fun-gcp"
}
