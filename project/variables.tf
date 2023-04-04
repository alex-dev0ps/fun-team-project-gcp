variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "instance_name" {
  default = "wordpress"
}

variable "database_version" {
  default = "MySQL_8_0"
}

variable "tier" {
  default = "db-f1-micro"
}

variable "database_name" {
  default = "fun-gcp"
}

variable "vpc_name" {
  default = "fun-gcp"
}

variable "project_name" {
  default = "poducbqsdzqzecoz"
}

variable "user_password" {
  default = "abracadabra"
}

variable "username" {
  default = "cheburashka"
}

variable "host" {
  default = "gena.com"
}

variable "lb_name" {
  default = "fun-gcp-lb"
}

variable "firewall" {
  default = "fun-gcp-firewall"
}

variable "target_pool_name" {
  default = "fun-gcp-target"
}

variable "asg_name" {
  default = "fun-gcp-asg"
}

variable "min_replicas" {
  default = "1"
}

variable "max_replicas" {
  default = "5"
}

variable "asg_cooldown" {
  default = "60"
}

variable "cpu_target" {
  default = "0.5"
}

variable "instance_manager" {
  default = "fun-gcp-instance"
}

variable "template_name" {
  default = "fun-gcp-template"
}

variable "template_machine_type" {
  default = "e2-medium"
}

# variable "source_image" {
#   default = "data.google_compute_image.centos_7.self_link"
# }

variable "db_password" {
  default = "12345678"
}