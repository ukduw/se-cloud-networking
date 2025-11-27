# Provider block - what provider(s) to interact with
provider "aws" {
    region = "eu-west-1"
}

# Service/resource
resource "aws_instance" "app_instance" {
    ami = "ami-0b985cf5be254fc1a"
    instance_type = "t3.micro"
    associate_public_ip_address = true
    security_groups = ["se-edmund-node20-app-sg"]

    key_name = "se-edmund-key-pair"

    user_data = file("./user-data.sh")

    # Name instance on AWS
    tags = {
        Name = "se-edmund-tf-app"
    }
}

