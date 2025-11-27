# Provider block - what provider(s) to interact with
provider "aws" {
    region = "eu-west-1"
}

# Service/resource
resource "aws_instance" "basic_instance" {
    ami = "ami-0b985cf5be254fc1a"
    instance_type = "t3.micro"
    associate_public_ip_address = true
    security_group_id = "sg-03d9f306bc305d7a6"

    key_name = se-edmund-key-pair

    user_data = <<-EOF
                #!/bin/bash
                sleep 15
                export DB_HOST=mongodb://<DB-IPADDRESS>:27017/posts
                cd /home/ubuntu
                cd se-test-app/nodejs20-se-test-app-2025/app
                sudo npm install
                node seeds/seed.js
                pm2 start app.js

    # Name instance on AWS
    tags = {
        Name = "se-edmund-tf-app"
    }
}

