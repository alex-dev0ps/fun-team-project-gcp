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

