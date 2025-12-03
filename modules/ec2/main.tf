variable "instance_type" { type = string }
variable "subnet_id" { type = string }
variable "security_group_ids" { type = list(string) }
variable "ami" { type = string }
variable "tags" { type = map(string) default = {} }

resource "aws_instance" "this" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = true
  tags = merge({"Name":"tf-ec2"}, var.tags)
}

output "instance_id" { value = aws_instance.this.id }
output "public_ip" { value = aws_instance.this.public_ip }