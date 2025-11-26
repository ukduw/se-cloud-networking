# Provider block - what provider(s) to interact with
provider "aws" {
    region = "eu-west-1"
}

# Service/resource
resource "aws_instance" "basic_instance" {
    ami = "ami-0b985cf5be254fc1a"
    instance_type = "t3.micro"
    associate_public_ip_address = true
    subnet_id = 
    security_groups = 

    key_name = se-edmund-key-pair

    user_data = <<-EOF
                #!/bin/bash


    # Name instance on AWS
    tags = {
        Name = "se-edmund-tf-vpc-app"
    }
}

