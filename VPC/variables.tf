/* variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
} */

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

variable "project_id" {
  type        = string
  default     = "zbcjybgpvxgmyzud"
  description = "project id of the account that you will create resources on it"
}

variable  "vpc_name" {
    type        = string
    default     = "global-vpc-gcp"
    description = "vpc name set as a global"
}

variable  "my_project_name" {
    type        = string
    default     = "fun-team-project-gcp"
    description = "project name is set"
}
