resource "aws_security_group" "allow_HTTP" {
  name        = "allow_HTTP"
  vpc_id      = var.VPC_ID
  description = "Allow HTTP access from anywhere"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.prefix}-AllowHTTP"
  }
}
