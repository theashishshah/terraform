provider "aws" {
  region = "ap-south-1"
}

data "aws_subnet" "default" {
  default_for_az    = true
  availability_zone = "ap-south-1a"
}

resource "aws_security_group" "ssh_access" {
  name        = "allow_ssh" # to sg group for aws
  description = "This SG group allow ssh from any machine"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "frontend_server" {
  ami                         = var.ami
  instance_type               = "t3.micro"
  key_name                    = var.key_pair
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.default.id
  vpc_security_group_ids      = [aws_security_group.ssh_access.id]
  tags = {
    Name = "frontend-server" # this will show in aws
  }

}

# resource "aws_instance" "devops_server" {
#   ami                         = var.ami
#   instance_type               = var.instance_1
#   key_name                    = var.key_pair
#   associate_public_ip_address = true
#   subnet_id                   = data.aws_subnet.default.id
#   vpc_security_group_ids      = [aws_security_group.ssh_access.id]
#   tags = {
#     Name = "devops_server"
#   }
# }


# # resource "aws_instance" "backend_server" {
# #   ami                         = var.ami
# #   instance_type               = var.instance_2
# #   key_name                    = var.key_pair
# #   associate_public_ip_address = true
# #   subnet_id                   = data.aws_subnet.default.id
# #   vpc_security_group_ids      = [aws_security_group.ssh_access.id]
# #   tags = {
# #     Name = "backend_server"
# #   }
# # }
