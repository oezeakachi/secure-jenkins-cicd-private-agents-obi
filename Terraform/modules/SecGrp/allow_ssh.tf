resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  vpc_id      = var.VPC_ID
  description = "Allow SSH access from anywhere"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.prefix}-AllowSSH"
  }
}
