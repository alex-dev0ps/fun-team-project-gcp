variable "project_name" {
  type        = string
  default     = "zbcjybgpvxgmyzud"
  description = "project id of the account that you will create resources on it"
}

variable "database_version" {
  type        = string
  default     = "MYSQL_8_0" #MYSQL_5_6, MYSQL_5_7, MYSQL_8_0, POSTGRES_9_6,POSTGRES_10, POSTGRES_11, POSTGRES_12, POSTGRES_13, SQLSERVER_2017_STANDARD, SQLSERVER_2017_ENTERPRISE,
  description = "specifies the database version"

}
variable "tier" {
  type        = string
  default     = "db-f1-micro"
  description = "specifies the database version"
}

variable "db_name" {
  type        = string
  default     = "my_database"
  description = "description"
}

variable "db_username" {
  type        = string
  default     = "admin"
  description = "database authorized username "
}
variable "db_host" {
  type        = string
  default     = "%"
  description = "description"

}
variable "db_password" {
  type        = string
  default     = "mydbppassword"
  description = "description"
}
variable "region" {
  type        = string
  default     = "us-central1"
  description = "add desired region"
}


variable "zone" {
  type        = string
  default     = "us-central1-a"
  description = "deploy resource on us-central1-a zone"
}
variable "authorized_networks" {
  type        = string
  default     = "0.0.0.0/0"
  description = "authorized networks ip incoming to the database"
}