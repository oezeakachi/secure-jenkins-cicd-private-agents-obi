variable "ami_id" {
  description = "The AMI ID to use for the Bastion EC2 instance"
}

variable "instance_type" {
  description = "The EC2 instance type for the Bastion server (e.g., t2.micro)"
}

variable "key_name" {
  description = "The name of the SSH key pair to associate with the Bastion EC2 instance"
}

variable "subnet_id" {
  description = "The subnet ID where the Bastion EC2 instance will be launched"
}

variable "prefix" {
  description = "Prefix to be used for tagging and naming AWS resources"
}

variable "allow_ssh_sg_id" {
  description = "Security Group ID for SSH access"
}

variable "allow_http_sg_id" {
  description = "Security Group ID for HTTP access"
}

variable "allow_egress_all_sg_id" {
  description = "Security Group ID for all egress"
}

variable "allow_jenkins_sg_id" {
  description = "Security Group ID for Jenkins access"
}
