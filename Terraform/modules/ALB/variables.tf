variable "VPC_ID" {
  description = "VPC ID"
}

variable "subnet_id" {
  description = "The subnet ID where the Bastion EC2 instance will be launched"
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

variable "AppInstance" {
  description = "App Server EC2 ID"
}
