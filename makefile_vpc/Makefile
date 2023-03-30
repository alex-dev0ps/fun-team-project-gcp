build-vpc:
	terraform init && terraform apply -var-file central1.tfvars --auto-approve

destroy-vpc:
	terraform init && terraform destroy -var-file central1.tfvars --auto-approve


build-newvpc:
	terraform workspace new newworkspace      || terraform workspace select newworkspace && terraform init && terraform apply -var-file central2.tfvars --auto-approve

destroy-newvpc:
	terraform workspace new newworkspace      || terraform workspace select newworkspace && terraform init && terraform destroy -var-file central2.tfvars --auto-approve