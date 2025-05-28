output "bastion_ip" {
  value = module.Bastion.Bastion_Public_IP
}

output "private_ip" {
  value = module.PrivateServer.Application_Server_IP
}

output "key_path" {
  value = module.Keys.key_path
}

# output "ALB_DNS" {
#   value = module.ALB.ALB_DNS
# }
