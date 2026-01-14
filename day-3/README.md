# Infrastructure as Code (IaC)
A DevOps practice where infrastructure is managed/provisioned through code and config files, rather than manual processes.
- Automates the creation of environments like networks, VMs, databases

Makes deployment faster, more consistent, repeatable.


## Terraform
IaC tools can be classified as:
- **Configuration orchestration (Terraform)**: provisioning of cloud resources
- **Configuration management (Ansible)**: maintaining a desired state in already-provisioned resources

**Terraform ubiquity**   
- Cloud agnostic
- Provisioning tool
- Modular
- Stepwise - more easily debuggable
- Ease of use
- "Open-source"
- Declarative (as opposed to imperative)

Terraform uses **HCL** (HashiCorp Configuration Language) - this allows engineers to describe what they want ("desired state" - this is **declarative logic**) **rather than writing imperative logic on how to do it**.


### Industries, companies using Terraform
IT services, software development, finance, business services...

JPMorgan Chase, Capital One, Netflix, Cisco, IBM, Oracle, PwC, Home Depot...


### Terraform and AWS
Provide Terraform with AWS access key and secret key. Terraform can then use them and call required AWS APIs to execute its templates for resource creations.

`terraform init`

During init, Terraform searches the config for providers referenced, such as AWS, and downloads the required plugins required to communicate with them. Terraform can then codify APIs into declarative files.


### Basic TF Commands
- `terraform plan`
- `teraform apply`
- `terraform destroy`


### TF State
Terraform stores the state of your managed infrastructure and configuration in a terraform.tfstate file.
- Keeps track of metadata
- Improves performance for large infrastructures

The state is used to determine which changes to make to the infrastructure
- Before any operation, TF refreshes to update the state with the real infrastructure

The primary purpose of tfstate is to store bindings between objects in a remote system and resource instances declared in the user's config, which is updated whenever objects are updated/deleted in config changes.

**tfstate is sensitive information since it stores every detail about the infrastructure/resources**
- **Shouldn't be pushed to repos**
- **Recommended to store it in HCP Terraform to version, encrypt, and transfer to team when working collaboratively**

---

### Terraform alternatives
Terraform has licensing/vendor lock-in, state management, HCL-only, and scaling complexity concerns, as well as limited collaboration/testing
- Pulumi
    - Uses general-purpose languages like TypeScript, Python, Go, .NET, Java
    - CI/CD, Git
    - Multi-cloud support (AWS, Azure, GCP, Kubernetes...)
    - Higher learning curve
- OpenTofu
    - Completely open source + no commercial/licensing restrictions
    - Compatible with existing Terraform modules/workflows
    - Less mature
- AWS CloudFormation
    - Native AWS support
    - Limited to AWS
    - JSON/YAML much more verbose than alternatives + poor modularity/abstraction
- Bicep (Azure)
    - Native Azure support
    - Very readable syntax
    - Modular/reusable
    - Limited to Azure
    - Less mature
- Ansible
    - Very readable YAML
    - Agentless (via SSH/WinRM)
    - Very strong configuration management after orchestration is done
    - Broad support
    - Very modular/reusable
    - Infrastructure provisioning (orchestration) is relatively limited
    - NO state management
    - Less idempotent than other declarative tools
- Chef, Puppet, SaltStack
    - Mature
    - Detailed control over system state and compliance
    - Good for managing long-lived, on-prem workloads
    - Steep learning curve
    - Requires agents/daemons
    - Somewhat outdated for modern IaC practices/workflows
    - Declining popularity

