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