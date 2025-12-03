terraform {
  required_providers {
    aws = { source = "hashicorp/aws" version = ">= 4.0" }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  tags = { environment = "dev" }
}

resource "aws_security_group" "ssh" {
  name = "allow_ssh"
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "web" {
  source = "../../modules/ec2"
  instance_type = var.instance_type
  subnet_id = module.vpc.public_subnet_id
  security_group_ids = [aws_security_group.ssh.id]
  ami = var.ami
  tags = { environment = "dev" }
}

output "web_ip" { value = module.web.public_ip }
output "vpc_id" { value = module.vpc.vpc_id }