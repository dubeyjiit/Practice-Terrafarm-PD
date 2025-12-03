variable "instance_type" { description = "EC2 instance type" type = string }
variable "subnet_id" { description = "Subnet id to launch instance" type = string }
variable "security_group_ids" { description = "List of SG ids" type = list(string) }
variable "ami" { description = "AMI id" type = string }
variable "tags" { description = "Tags" type = map(string) default = {} }