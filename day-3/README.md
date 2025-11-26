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

Terraform uses **HCL** (HashiCorp Configuration Language) - this allows engineers to describe what they want ("desired state" - this is **declarative logic**) **rather than writing imperative logic on how to do it**.

### Industries, companies using Terraform
IT services, software development, finance, business services...

JPMorgan Chase, Capital One, Netflix, Cisco, IBM, Oracle, PwC, Home Depot...

### Terraform and AWS
Provide Terraform with AWS access key and secret key. Terraform can then use them and call required AWS APIs to execute its templates for resource creations.

`terraform init`

During init, Terraform searches the config for providers referenced, such as AWS, and downloads the required plugins required to communicate with them. Terraform can then codify APIs into declarative files.

### Setup with AWS
- Need to add **ACCESS and SECRET keys**; options:
    - Add to **AWS config and credentials files**
    - Add as **environment variables**
- Recommended to add keys as credentials
- AWS uses 2 files stored in home directory to authenticate via AWS CLI:
    - `~/.aws/credentials`
    - `~/.aws/config`
    - These files store **access keys, default region, profiles (optional)**

The above can be done manually or via **awscli**   
- `sudo apt install awscli`
    - `aws --version` to check
- `aws configure`
    - You will be prompted to enter the following:
        - **AWS Acess Key ID**: YOUR_KEY_ID
        - **AWS Secret Access Key**: YOUR_SECRET_KEY
        - **Default region name**: eu-west-1
        - **Default output format**: json
- Check the files are set up:
    - `~/.aws/credentials`
    - `~/.aws/config`
- The contents should be:
    - ```
        ~/.aws/credentials
        [default]
        aws_acess_key_id = YOUR_KEY_ID
        aws_secret_access_key = YOUR_SECRET_KEY
        ```
    - ```
        ~/.aws/config
        [default]
        region = eu-west-1
        output = json
        ```
- Check connection to AWS:
    - `aws sts get-caller-identity`
- The output should be:
    - ```
        {
            "UserId": "AIDA...",
            "Account": "123456789012",
            "Arn": "arn:aws:iam::123456789012:user/your-user"
        }
        ```

