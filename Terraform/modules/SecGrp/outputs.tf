output "allow_ssh_sg_id" {
  description = "Security Group ID for SSH access"
  value       = aws_security_group.allow_ssh.id
}

output "allow_http_sg_id" {
  description = "Security Group ID for HTTP access"
  value       = aws_security_group.allow_HTTP.id
}

output "allow_egress_all_sg_id" {
  description = "Security Group ID for all egress"
  value       = aws_security_group.allow_Egress_All.id
}

output "allow_jenkins_sg_id" {
  description = "Security Group ID for Jenkins access"
  value       = aws_security_group.allow_jenkins.id
}

output "default_sg_id" {
  value = aws_default_security_group.default.id
}
