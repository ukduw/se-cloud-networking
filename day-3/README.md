# Infrastructure as Code (IaC)
A DevOps practice where infrastructure is managed/provisioned through code and config files, rather than manual processes.
- Automates the creation of environments like networks, VMs, databases

Makes deployment faster, more consistent, repeatable.


## Terraform
IaC tools can be classified as:
- **Configuration orchestration (Terraform)**: provisioning of cloud resources
- **Configuration management (Ansible)**: maintaining a desired state in already-provisioned resources

Terraform uses **HCL** (HashiCorp Configuration Language) - this allows engineers to describe what they want ("desired state" - this is **declarative logic**) **rather than writing imperative logic on how to do it**.

### Industries, companies using Terraform
IT services, software development, finance, business services...

JPMorgan Chase, Capital One, Netflix, Cisco, IBM, Oracle, PwC, Home Depot...

### Terraform and AWS
Provide Terraform with AWS access key and secret key. Terraform can then use them and call required AWS APIs to execute its templates for resource creations.

`terraform init`

During init, Terraform searches the config for providers referenced, such as AWS, and downloads the required plugins required to communicate with them. Terraform can then codify APIs into declarative files.

