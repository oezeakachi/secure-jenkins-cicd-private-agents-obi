resource "aws_security_group" "allow_Egress_All" {
  name        = "allow_egress_all"
  vpc_id      = var.VPC_ID
  description = "Allow all egress traffic"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.prefix}-AllowEgressAll"
  }
}
