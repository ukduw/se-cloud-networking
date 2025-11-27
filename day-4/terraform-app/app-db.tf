# Provider block - what provider(s) to interact with
provider "aws" {
    region = "eu-west-1"
}

# Service/resource
resource "aws_instance" "db_instance" {
    ami = var.db_ami_id
    instance_type = var.db_instance_type
    associate_public_ip_address = false
    security_groups = [var.db_sg]

    key_name = var.db_key_pair

    # Name instance on AWS
    tags = {
        Name = "se-edmund-tf-db"
    }
}

resource "aws_instance" "app_instance" {
    ami = var.app_ami_id
    instance_type = var.instance_type
    associate_public_ip_address = true
    security_groups = [var.app_sg]

    key_name = var.app_key_pair

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

