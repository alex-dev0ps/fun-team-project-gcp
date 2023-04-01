# Instructions how to create the resouses in ANY region:

## Setting billing account. Creating the project:

#### 1) Open in terminal of "account"
#### 2) Run commands below:
```
terraform init
terraform apply -auto-approve
```

## BUILD The Resourses in ANY region:
### Creating Global VPC with auto configured subnets. Creating ASG with LB. Creating CloudSQL to use with wordpress.

#### 1) Create newproject.tfvars file (the name of the file is very important, it should be exactly <newproject.tfvars>). Write the code with nesessary region and zone. For example, if you'd like to create resources in asia-east2 region and asia-east2-a zone, you should put the code below:

```
region = "asia-east2"

zone = "asia-east2-a"
```

#### 2) Open <variables.tf>. In this block change default value to letters from your project line (yellow line)
```
variable "project_name" {
  default = "iksfneshyzfuiezr"
}
```

#### 3) Open in terminal of "project"
#### 4) Run command below:
```
make build-newproject
```

## DESTROY The Resourses in us-central1 region:
### Destroying Global VPC with auto configured subnets. Destroying ASG with LB. Destroying CloudSQL to use with wordpress.

#### 1) Open in terminal of "project"
#### 2) Run command below:
```
make destroy-newproject
```