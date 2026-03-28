output "devops_server_ip" {
  value = aws_instance.nginx_server.public_ip
}

# output "backend_server_ip" {
#   value = aws_instance.backend_server.public_ip
# }

output "default_subnet_id" {
  value = data.aws_subnet.default.id
}

# output "sg_group_id" {
#   value = resource.aws_security_group.allow_ssh.public_ip
# }
