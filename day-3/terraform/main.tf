# Create an EC2 instance

# Provider block - what provider(s) to interact with
provider "aws" {
    region = "eu-west-1"

    # Terraform will download all required dependencies/plugins when `terraform init` is run
}

# Service/resource
resource "aws_instance" "basic_instance" {
    ami = "ami-0b985cf5be254fc1a"
    instance_type = "t3.micro"
    associate_public_ip_address = true

    # Name instance on AWS
    tags = {
        Name = "se-edmund-test-tf-instance"
    }
}



# terraform init, plan, destroy