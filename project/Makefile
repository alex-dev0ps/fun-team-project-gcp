build-project:
	terraform init && terraform apply -var-file project.tfvars --auto-approve

destroy-project:
	terraform init && terraform destroy -var-file project.tfvars --auto-approve


build-newproject:
	terraform workspace new newworkspace      || terraform workspace select newworkspace && terraform init && terraform apply -var-file newproject.tfvars --auto-approve

destroy-newproject:
	terraform workspace new newworkspace      || terraform workspace select newworkspace && terraform init && terraform destroy -var-file newproject.tfvars --auto-approve