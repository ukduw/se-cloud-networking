# Provider block - what provider(s) to interact with
provider "aws" {
    region = "eu-west-1"
}

# Service/resource blocks
# === VPC ===
resource "aws_vpc" "main" {
    cidr_block          = "10.0.0.0/16"
    enable_dns_support  = true
    enable_dns_hostnames= true

    tags = {
        Name = "se-edmund-tf-vpc"
    }
}

# === Subnets ===
resource "aws_subnet" "subnet_private" {
    vpc_id              = aws_vpc.main.id
    cidr_block          = "10.0.2.0/24"
    availability_zone   = "eu-west-1a"

    tags = {
        Name = "se-edmund-tf-priv-subnet"
    }
}

resource "aws_subnet" "subnet_public" {
    vpc_id              = aws_vpc.main.id
    cidr_block          = "10.0.3.0/24"
    availability_zone   = "eu-west-1b"

    tags = {
        Name = "se-edmund-tf-pub-subnet"
    }
}

# === IGW ===
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "se-edmund-tf-igw"
    }
}

# === RT ===
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "se-edmund-tf-rt"
    }
}

# === RT association ===
resource "aws_route_table_association" "public_association" {
    subnet_id       = aws_subnet.subnet_public.id
    route_table_id  = aws_route_table.public_rt.id
}

# === SGs ===
resource "aws_security_group" "db_sg" {
    name= "se-edmund-tf-db-sg"
    vpc_id= aws_vpc.main.id

    ingress {
        from_port= 27017
        to_port= 27017
        protocol= "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }

    ingress {
        from_port= 22
        to_port= 22
        protocol= "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }

    egress {
        from_port= 0
        to_port= 0
        protocol= "-1"
        cidr_blocks= ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "app_sg" {
    name= "se-edmund-tf-app-sg"
    vpc_id= aws_vpc.main.id

    ingress {
        from_port= 3000
        to_port= 3000
        protocol= "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }

    ingress {
        from_port= 80
        to_port= 80
        protocol= "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }

    ingress {
        from_port= 22
        to_port= 22
        protocol= "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }

    egress {
        from_port= 0
        to_port= 0
        protocol= "-1"
        cidr_blocks= ["0.0.0.0/0"]
    }
}

# === EC2 instances ===
resource "aws_instance" "db_instance" {
    ami                         = var.db_ami_id
    instance_type               = var.db_instance_type
    associate_public_ip_address = false
    subnet_id                   = aws_subnet.subnet_private.id
    security_groups             = [aws_security_group.db_sg.id]

    key_name                    = var.db_key_pair

    tags = {
        Name = "se-edmund-tf-db"
    }
}

resource "aws_instance" "app_instance" {
    ami                         = var.app_ami_id
    instance_type               = var.instance_type
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.subnet_public.id
    security_groups             = [aws_security_group.app_sg.id]

    key_name                    = var.app_key_pair

    user_data = templatefile("user-data.sh", {
        DATABASE_IP = aws_instance.db_instance.public_ip
    })

    # Ensure db is created first
    depends_on = [aws_instance.db_instance]

    tags = {
        Name = "se-edmund-tf-app"
    }
}

