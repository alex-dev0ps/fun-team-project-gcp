# Instructions how to create the resouses in ANY region:

## Setting billing account. Creating the project:

### 1) Open in terminal of "account"
### 2) Run commands below:
```
terraform init
terraform apply -auto-approve
```

## BUILD The Resourses in us-central1 region:
## Creating Global VPC with auto configured subnets. Creating ASG with LB. Creating CloudSQL to use with wordpress.

### 1) Open in terminal of "project"
### 2) Run command below:
```
make build-project
```

## DESTROY The Resourses in us-central1 region:
## Destroying Global VPC with auto configured subnets. Destroying ASG with LB. Destroying CloudSQL to use with wordpress.

### 1) Open in terminal of "project"
### 2) Run command below:
```
make destroy-project
```