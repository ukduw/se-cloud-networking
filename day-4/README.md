### Basic Terraform Commands
- `terraform plan`
- `terraform apply`
- `terraform destroy`


### Variables
See variable.tf for syntax and notes
- Call with var.variable_name


### .tfvars
Contains parameterized variables to be overwritten when run via:
- `terraform <plan/apply> -var-file="dev.tfvars"`
- `terraform <plan/apply> -var-file="prod.tfvars"`

