
output "Application_Server_IP" {
  value = aws_instance.Application.private_ip
}

output "Application_Server_ID" {
  value = aws_instance.Application.id
}
