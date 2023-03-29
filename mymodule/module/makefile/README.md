## Instructions

### Creating the VPC from Makefile:

#### Step 1: Open in terminal of "mymodule/module/makefile"

#### Step 2: Create central1.tfvars file

#### Step 3: Put vars below to central1.tfvars file
```
region = "us-central1"

zone = "us-central1-a"
```

#### Step 4: Run command below:
```
make build-vpc
```


### To destroy: Run command below:
```
make destroy-vpc
```