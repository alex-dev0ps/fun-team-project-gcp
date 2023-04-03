# fun-team-project-gcp

# Prerequisities


### -Login to your Google Cloud Console and Create a Billing Account. in order to create resources on GCP we need a billing account. Specify which billing account will be use.

### - Git Clone Project URL (SSH Endpoint) from your GitHub Repository by using GCP Cloud Shell. Check the logs and make sure it's cloned properly.

```bash
git clone "project URL"
```

### - Go to account.tf folder and run "terraform init" and "terraform apply" to create a project with the billing account added using the following code:


## Needed Resources

```

data "google_billing_account" "acct" {
  display_name = "My Billing Account"
  open         = true
}


output "billing_account_name" {
  value = data.google_billing_account.acct.name
}


resource "random_password" "password" {
  length  = 16
  numeric = false
  special = false
  lower   = true
  upper   = false
}



resource "google_project" "fun-team-project-gcp" {
  name            = "fun-team-project-gcp"
  project_id      = random_password.password.result
  billing_account = data.google_billing_account.acct.id
}

# Set terminal to this project above
resource "null_resource" "set-project" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "gcloud config set project ${google_project.fun-team-project-gcp.project_id}"
  }
}


resource "null_resource" "unset-project" {
  provisioner "local-exec" {
    when    = destroy
    command = "gcloud config unset project"
  }
}


resource "null_resource" "enable-apis" {
  depends_on = [
    google_project.fun-team-project-gcp,
    null_resource.set-project
  ]
  triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = <<-EOT
        gcloud services enable compute.googleapis.com
        gcloud services enable dns.googleapis.com
        gcloud services enable storage-api.googleapis.com
        gcloud services enable container.googleapis.com
        gcloud services enable file.googleapis.com
    EOT
  }
}
```

### -Projeck ID has yellow color, once you create your project you can start provisioning resources on top of it. only way provisioning resources is depend on this Project ID. You can not open new terminal to switch beetween folders. Use cd commands to switch folders. 

```
Create GCP Back End Bucket
```
### -Exit account folder use "cd commands" and make sure you are in the "fun-team-project-gcp" folder then move to ```backend_storage``` with cd commans. that wway you will not loose Project ID.

### -Run terraform init and apply commands to create a Cloud Storage Bucket for our tfstate files as a backend storage.

### - ```output``` ```bucket_name``` resource will print our bucket name when resource privisioned after terraform init and apply.

```
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "back_end_bucket" {
  name          = "gcp-${random_id.bucket_prefix.hex}-bucket-tfstate"
  force_destroy = false
  location      = "EU"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}
output  bucket_name {
    value = google_storage_bucket.back_end_bucket.name
}

```
```
CLOUDSQL FOR MYSQL DATABASE
```

- Under ropo folder creadte DB folder and add necessary tf files (varaibles.tf, dbinstanse.tf, provider.tf) 

- Add resources mantioned below ;
  - “google_sql_database_instance” 
  - "random_id " 
  - " google_sql_database" resources 
```
resource "random_id" "db_name_suffix" {
  byte_length = 3
}

resource "google_sql_database_instance" "mysql-from-terraform" {
  name             = "mysql-from-terraform-${random_id.db_name_suffix.hex}"
  region           = var.region
  database_version = var.database_version
  deletion_protection  = "false"

  settings {
    tier = "db-f1-micro"
    
ip_configuration {
      ipv4_enabled = "true"

      authorized_networks {
        value           = var.authorized_networks
        name            = var.db_username
        
      }
    
    # location_preference {
    #   zone = var.zone
    # }
    }
}
}
```

```
resource "google_sql_database" "database" {
  name     = var.my_dbname
  instance = google_sql_database_instance.mysql-from-terraform.name
}
```

```
resource "google_sql_user" "users" {
  name     = var.db_username
  instance = google_sql_database_instance.mysql-from-terraform.name
  host     = var.db_host
  password = var.db_password
}
```
- Use variables for making resources dynamic.
- in your Repo Folder make sure "sqladmin.googleapis.com" service is enabled, to do that run;
```
gcloud services enable sqladmin.googleapis.com

```
### Step 1
- In DB Folder run terraform init then apply. check GCLOUD if "mysql-from-terraform" has been created.
- added user to DB INSTANCE so you can connect DB instance from cloud shell. to connect DB INSTANCE run ;
```
gcloud sql connect  "dbinstancename" --user=admin  --quiet
```
### Step 2 
- check GCLOUD console if database is created, if you can connect database you are good to go.

```
VIRTUAL PRIVATE CLOUD (GCP) MODULE
```

### - Google Cloud VPC  is providing global and managed virtuall network. For that reason we use GLOBAL VPC .
 - create a folder has vpc.tf file with .ignore and README.md files in it. use google_compute_network resource to create global VPC:

```
resource "google_compute_network" "vpc" {
  name                    = "fun-team-project-gcp"
  auto_create_subnetworks = "true"
  routing_mode            = "GLOBAL"
}

output "vpc_id" {
  value = google_compute_network.vpc.id
}

```



- ###### if your project ID is not set , run GCP Command for setting the project: 

```
gcloud config set project PROJECT_ID
```
- Run terraform init command to initialize it
- Run terraform plan and see if you have any syntax error
- Run terraform apply to apply your changes
- Go to Google Console and check if your VPC is created under the name of "vpc-fun-team-project-gcp"