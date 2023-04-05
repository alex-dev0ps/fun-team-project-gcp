# Build terraform module for a Three-Tier application on GCP in ANY region with a few clicks!
### Creating Global VPC with auto configured subnets, ASG with LB, S3 Backend and CloudSQL to use with wordpress:
__________________________________________________________________________________________________________________________


## 1) Create your Google account with Credit Card information in it
## 2) Login to your Google Cloud Console
## 3) Go to Cloud Shell, open Editor
## 4) Clone this repository from GitHub. Run command below:
```
cd && git clone git@github.com:alex-dev0ps/fun-team-project-gcp.git
```
__________________________________________________________________________________________________________________________
## 5) Setting billing account. Creating the project ID:
### Please open /fun-team-project-gcp folder. Then open /account folder. To open in terminal of /account, you can right click on /account folder and "open in terminal". You can also run commands below instead:
```
cd ..
cd account
```
__________________________________________________________________________________________________________________________
### Now you are in /fun-team-project-gcp/account folder. Please run commands below to set up the project ID:
```
terraform init
terraform apply -auto-approve
```
__________________________________________________________________________________________________________________________
## 6) Changing project ID in variables.tf and .tfvars files
### Make sure you see your project ID in yellow color to verify you are inside your project and can start provisioning resources. Please copy this yellow line from your CLI (your project ID) and put it instead the existing default value in variables.tf file like shown below:
```
variable "project_name" {
  default = "copy the yellow ID from CLI"
}
```
### Also copy this yellow line (your project ID) and put it instead the existing default value in ALL .tfvars files like shown below. (.tfvars files are located in /env/regions folder).
```
project_name = "copy the yellow ID from CLI"
```
__________________________________________________________________________________________________________________________
## 7) Now you are in /fun-team-project-gpc/account. To create the resources you should be in /fun-team-project-gpc/project. Please don't use right click and don't "open in terminal". You should run the following commands instead:
```
cd ..
cd project
```
__________________________________________________________________________________________________________________________
## 8) Open Makefile. Pick the region where you'd like to create the resourses. For example, you'd like to create the resorces in Iowa (us-central1 region):
__________________________________________________________________________________________________________________________
## Run command below:
```
make build-iowa
```

## That's it! Your resources are being created now! Just wait a few minutes (more like 20) for them to be ready... 
__________________________________________________________________________________________________________________________
__________________________________________________________________________________________________________________________

# IMPORTANT INFORMATION:
## If you see Apache TEST page instead of Wordpress, please read below:

#### The steps to clear your browser cache may vary depending on the browser you are using. Here are some general instructions that should work for most browsers:

##### 1. Open your browser.
##### 2. Go to the settings or options menu (usually represented by three dots or lines in the upper right corner of the browser window).
##### 3. Click on "Settings" or "Options".
##### 4. Find the "Privacy and Security" section.
##### 5. Look for an option to clear your cache or browsing data.
##### 6. Click on "Clear data" or "Clear browsing data".
##### 7. Choose the time range for which you want to clear the cache (e.g. "Last hour", "Last 24 hours", "All time").
##### 8. Make sure "Cached images and files" is checked.
##### 9. Click on "Clear data" or "Clear browsing data" again to confirm.

__________________________________________________________________________________________________________________________
__________________________________________________________________________________________________________________________

## DESTROY The Resourses in Iowa (us-central1 region):
### Destroying Global VPC with auto configured subnets. Destroying S3 Backend. Destroying ASG with LB. Destroying CloudSQL.

### 1) Make sure, that you are still in /fun-team-project-gpc/project folder. Open /project folder, if you are not there yet. Please don't use right click and don't "open in terminal". You should run the "cd" command.

### 2) Run command below:
```
make destroy-iowa
```

## That's it! Your resources are being destroyed now! Just wait a few minutes for them to dissapear... 