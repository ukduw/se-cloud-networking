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





