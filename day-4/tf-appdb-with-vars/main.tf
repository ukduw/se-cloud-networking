# Provider block - what provider(s) to interact with
provider "aws" {
    region = "eu-west-1"
}

# Service/resource
resource "aws_instance" "db_instance" {
    ami = "ami-068be8a2a1c4f493f"
    instance_type = "t3.micro"
    associate_public_ip_address = false
    security_groups = ["se-edmund-mongodb-sg"]

    key_name = "se-edmund-key-pair"

    # Name instance on AWS
    tags = {
        Name = "se-edmund-tf-db"
    }
}

resource "aws_instance" "app_instance" {
    ami = "ami-0b985cf5be254fc1a"
    instance_type = "t3.micro"
    associate_public_ip_address = true
    security_groups = ["se-edmund-node20-app-sg"]

    key_name = "se-edmund-key-pair"

    user_data = templatefile("user-data.sh", {
        DATABASE_IP = aws_instance.db_instance.public_ip
    })

    # Ensure db is created first
    depends_on = [aws_instance.db_instance]

    # Name instance on AWS
    tags = {
        Name = "se-edmund-tf-app"
    }
}

