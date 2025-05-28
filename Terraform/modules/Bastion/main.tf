resource "aws_instance" "Bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.allow_egress_all_sg_id, var.allow_ssh_sg_id, var.allow_jenkins_sg_id]
  subnet_id                   = var.subnet_id
  tags = {
    Name = "${var.prefix}-Bastion-Server"
  }
}
