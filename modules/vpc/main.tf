variable "vpc_cidr" { type = string }
variable "public_subnet_cidr" { type = string }
variable "tags" { type = map(string) default = {} }

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = merge({"Name":"tf-vpc"}, var.tags)
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true
  tags = merge({"Name":"tf-public-subnet"}, var.tags)
}

output "vpc_id" { value = aws_vpc.this.id }
output "public_subnet_id" { value = aws_subnet.public.id }