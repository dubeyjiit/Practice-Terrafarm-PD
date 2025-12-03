variable "region" { default = "ap-south-1" }
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnet_cidr" { default = "10.0.1.0/24" }
variable "instance_type" { default = "t3.micro" }
variable "ami" { description = "AMI id for instances" default = "ami-0e0e7f3e8de5a7891" }