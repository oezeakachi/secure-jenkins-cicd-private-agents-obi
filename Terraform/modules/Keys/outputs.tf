output "Key_Name" {
  value = aws_key_pair.ssh_key.key_name
}
output "key_path" {
  value = local_file.ssh_private_key.filename
}
