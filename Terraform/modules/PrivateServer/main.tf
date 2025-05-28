resource "aws_instance" "Application" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = false
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.allow_egress_all_sg_id, var.allow_ssh_sg_id, var.allow_http_sg_id]
  subnet_id                   = var.subnet_id
  tags = {
    Name = "${var.prefix}-Application-Server"
  }
}
