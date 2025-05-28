variable "bastion_ip" {
  description = "Bastion EC2 Public IP"
}

variable "private_ip" {
  description = "Application EC2 Private IP"
}

variable "key_path" {
  description = "Path to the SSH key pair"
}
