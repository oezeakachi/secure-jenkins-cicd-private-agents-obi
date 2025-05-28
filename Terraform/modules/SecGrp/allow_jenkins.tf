resource "aws_security_group" "allow_jenkins" {
  name        = "allow_jenkins"
  vpc_id      = var.VPC_ID
  description = "Allow Jenkins access from anywhere"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.prefix}-AllowJenkins"
  }
}
