variable "vpc_cidr_block" {
  description = "VPC CIDR block"
}

variable "Public_Subnets_count" {
  description = "Public Subnets Count"
}

variable "Private_Subnets_count" {
  description = "Private Subnets Count"
}

variable "region" {
  description = "AWS region"
}

variable "instance_type" {
  description = "EC2s Instance Type"
}
