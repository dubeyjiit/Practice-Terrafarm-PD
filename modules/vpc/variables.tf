# variables defined in module/vpc (documented)
variable "vpc_cidr" { description = "CIDR for VPC" type = string }
variable "public_subnet_cidr" { description = "CIDR for public subnet" type = string }
variable "tags" { description = "Tags map" type = map(string) default = {} }