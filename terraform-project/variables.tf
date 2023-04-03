variable "project_name" {
  type        = string
  default     = "qptaluqgzrqzmloo"
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
  default     = "database"
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
  default     = "atma-ziya"
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
variable "ASG_name" {
  type        = string
  default     = "my-autoscaler-team3"
  description = "desired name for the autoscaling"
}
variable "template_name" {
  type        = string
  default     = "my-instance-template"
  description = "desired name for the compute instance template" 
}
variable "machine_type" {
  type        = string
  default     = "e2-small"
  description = "add your machine type"
}
variable "vpc_name" {
  type        = string
  default     = "vpc-network-team3"
  description = "desired name of the vpc being created"
}
variable "lb_name" {
  type        = string
  default     = "load-balancer"
  description = "description"
}

variable "targetpool_name" {
  type        = string
  default     = "my-target-pool"
  description = "description"
}

variable "vpc_subnetip_range" {
  type        = string
  default     = "192.168.10.0/24"
  description = "CIDR range of the VPC being created"
}
variable "minimum_instances" {
  type        = number
  default     = "1"
  description = "minimum desired instances running at a given point"
}

variable "maximum_instances" {
  type        = number
  default     = "5"
  description = "maximum desired instances running at a given point"
}
variable "igm_name" {
  type        = string
  default     = "my-igm"
  description = "description"
}