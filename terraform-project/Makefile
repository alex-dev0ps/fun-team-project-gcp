
australia-southeast1:
	terraform init && terraform workspace new australia || terraform workspace select australia  &&  terraform apply -var-file envs/regions/australia-southeast1.tfvars -auto-approve

build-london:  
	terraform init && terraform workspace new london  || terraform workspace select london  &&  terraform apply -var-file envs/regions/europe-west2.tfvars -auto-approve




destroy-australia:
	terraform workspace select australia && terraform destroy -var-file envs/regions/australia-southeast1.tfvars 

destroy-london: 
	terraform workspace select london && terraform destroy -var-file envs/regions/europe-west2.tfvars 