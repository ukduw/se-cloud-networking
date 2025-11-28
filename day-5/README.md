## Terraform Modules
A module is a self-contained package of tf configurations that are managed together
- This allows for **encapsulation and reuse of common code**
- Greatly **simplifies** complex/lengthy tf configurations

A module can consist of **one or more .tf files**
- Typically **organized by resource type**
    - Networking, compute, storage...


### Example networking module 
**main.tf**   
```
resource  "aws_vpc" "main_vpc" {
    cidr_block = var.cidr_block
}

resource "aws_subnet" "subnet" {
    vpc_id              = aws_vpc.main_vpc.id
    cidr_block          = var.subnet_cidr_block
    availability_zone   = var.availability_zone
}
```

**variables.tf**   
...

**root configuration** (reference module via source=)   
```
module "networking" {
    source              = "./modules/networking"
    cidr_block          = "10.0.0.0/16"
    subnet_cidr_block   = "10.0.2.0/24"
    availability_zone   = "eu-west-1a
}
```


## Terraform Workspaces
A means to **manage multiple environments** within each tf configuration
- e.g. 1. development, 2. staging, 3. production

**Workspaces are isolated, with their own state.** This means multiple versions of the infrastructure can be worked on concurrently without effecting other environments.
- Each workspace has a **separate tfstate file**
- Multiple workspaces can use **one configuration**, avoiding duplication


### Basic Workspace Commands
- `terraform workspace new dev` creates new workspace named "dev"
- `terraform workspace select dev` switches to existing workspace, dev
- `terraform workspace list` lists available workspaces
- `terraform workspace show` shows current workspace
- `terraform workspace delete dev` deletes the "dev" workspace

**Referencing workspaces in configuration**   
```
resource "aws_s3_bucket" "bucket" {
    bucket  = "bucket-${terraform.workspace}"

    acl     = "private"
}
```
- Note: bucket names dynamically assigned based on workspace names

**File structure does not change when working with workspaces**
- main.tf, variable.tf, outputs.tf, name.tfvars... **are shared for all workspaces**
- While the state is isolated per workspace


### Combining modules and workspaces
**main.tf in root config**   
```
module "networking" {
  source            = "./modules/networking"
  cidr_block        = "10.0.0.0/16"
  subnet_cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-1a"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-${terraform.workspace}"
  acl    = "private"
}
```


---
---

`terraform init`

`terraform workspace new dev`   
`terraform apply`

`terraform workspace new prod`   
`terraform apply`

