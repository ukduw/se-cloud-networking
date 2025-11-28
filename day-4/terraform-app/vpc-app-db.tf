# Provider block - what provider(s) to interact with
provider "aws" {
    region = var.aws_region
}

provider "github" {
    token = var.github_token
}



# Service/resource blocks
# === GitHub ===
resource "github_repository" "tf_test_repo" {
    name    = "tf-test-repo"
    visibility = "private"
}

output "github_repo_url" {
    value = github_repository.tf_test_repo.http_clone_url
}


# === VPC ===
resource "aws_vpc" "main" {
    cidr_block          = var.vpc_cidr
    enable_dns_support  = true
    enable_dns_hostnames= true

    tags = {
        Name = "se-edmund-tf-vpc"
    }
}


# === Subnets ===
resource "aws_subnet" "subnet_private" {
    vpc_id              = aws_vpc.main.id
    cidr_block          = var.priv_subnet_cidr
    availability_zone   = var.aws_az_a

    tags = {
        Name = "se-edmund-tf-priv-subnet"
    }
}

resource "aws_subnet" "subnet_public" {
    vpc_id              = aws_vpc.main.id
    cidr_block          = var.pub_subnet_cidr
    availability_zone   = var.aws_az_b

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
        cidr_block = var.cidr_default
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
    name    = "se-edmund-tf-db-sg"
    vpc_id  = aws_vpc.main.id

    egress {
        from_port= 0
        to_port= 0
        protocol= "-1"
        cidr_blocks= [var.cidr_default]
    }
}

resource "aws_security_group_rule" "db_sg_ingress" {
    for_each = {for port in var.db_ports: port => port}

    type                = "ingress"
    from_port           = each.key
    to_port             = each.key
    protocol            = "tcp"
    cidr_blocks         = [var.cidr_default]
    security_group_id   = aws_security_group.db_sg.id
}

resource "aws_security_group" "app_sg" {
    name    = "se-edmund-tf-app-sg"
    vpc_id  = aws_vpc.main.id

    egress {
        from_port= 0
        to_port= 0
        protocol= "-1"
        cidr_blocks= [var.cidr_default]
    }
}

resource "aws_security_group_rule" "app_sg_ingress" {
    for_each = {for port in var.app_ports: port => port}

    type                = "ingress"
    from_port           = each.key
    to_port             = each.key
    protocol            = "tcp"
    cidr_blocks         = [var.cidr_default]
    security_group_id   = aws_security_group.app_sg.id
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
    instance_type               = var.app_instance_type
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.subnet_public.id
    security_groups             = [aws_security_group.app_sg.id]

    key_name                    = var.app_key_pair

    user_data = templatefile("user-data.sh", {
        DATABASE_IP = aws_instance.db_instance.private_ip
    })

    # Ensure db is created first
    depends_on = [aws_instance.db_instance]

    tags = {
        Name = "se-edmund-tf-app"
    }
}

