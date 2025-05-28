resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh-key"
  public_key = tls_private_key.ssh.public_key_openssh
}

resource "local_file" "ssh_private_key" {
  content              = tls_private_key.ssh.private_key_pem
  filename             = pathexpand("~/.ssh/ssh-key.pem")
  file_permission      = "0400"
  directory_permission = "0700"
}
