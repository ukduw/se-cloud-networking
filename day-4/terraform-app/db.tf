provider "aws" {
    region = "eu-west-1"
}

# Service/resource
resource "aws_instance" "basic_instance" {
    ami = "ami-068be8a2a1c4f493f"
    instance_type = "t3.micro"
    associate_public_ip_address = false
    security_group_id = "sg-092ccb39a6de1646e"

    key_name = se-edmund-key-pair

    # Name instance on AWS
    tags = {
        Name = "se-edmund-tf-db"
    }
}

