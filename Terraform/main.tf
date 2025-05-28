module "Network" {
  source                = "./modules/Network"
  prefix                = local.prefix
  zone1                 = local.zone1
  zone2                 = local.zone2
  vpc_cidr_block        = var.vpc_cidr_block
  Public_Subnets_count  = var.Public_Subnets_count
  Private_Subnets_count = var.Private_Subnets_count
}

module "SecGrp" {
  source         = "./modules/SecGrp"
  VPC_ID         = module.Network.vpc_id
  VPC_CIDR_BLOCK = module.Network.VPC_CIDR
  prefix         = local.prefix
}

module "Keys" {
  source = "./modules/Keys"
}


module "Bastion" {
  source                 = "./modules/Bastion"
  ami_id                 = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  allow_ssh_sg_id        = module.SecGrp.allow_ssh_sg_id
  allow_http_sg_id       = module.SecGrp.allow_http_sg_id
  allow_egress_all_sg_id = module.SecGrp.allow_egress_all_sg_id
  allow_jenkins_sg_id    = module.SecGrp.allow_jenkins_sg_id
  key_name               = module.Keys.Key_Name
  prefix                 = local.prefix
  subnet_id              = module.Network.public_subnet_ids[0]

}

module "PrivateServer" {
  source                 = "./modules/PrivateServer"
  ami_id                 = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  allow_ssh_sg_id        = module.SecGrp.allow_ssh_sg_id
  allow_http_sg_id       = module.SecGrp.allow_http_sg_id
  allow_egress_all_sg_id = module.SecGrp.allow_egress_all_sg_id
  allow_jenkins_sg_id    = module.SecGrp.allow_jenkins_sg_id
  key_name               = module.Keys.Key_Name
  prefix                 = local.prefix
  subnet_id              = module.Network.private_subnet_ids[0]
}

# module "ALB" {
#   source                 = "./modules/ALB"
#   VPC_ID                 = module.Network.vpc_id
#   subnet_id              = module.Network.public_subnet_ids
#   AppInstance            = module.PrivateServer.Application_Server_ID
#   allow_ssh_sg_id        = module.SecGrp.allow_ssh_sg_id
#   allow_http_sg_id       = module.SecGrp.allow_http_sg_id
#   allow_egress_all_sg_id = module.SecGrp.allow_egress_all_sg_id
#   allow_jenkins_sg_id    = module.SecGrp.allow_jenkins_sg_id
# }

module "Provisioners" {
  source     = "./modules/Provisioners"
  bastion_ip = module.Bastion.Bastion_Public_IP
  private_ip = module.PrivateServer.Application_Server_IP
  key_path   = module.Keys.key_path
  depends_on = [
    module.Bastion,
    module.PrivateServer
  ]
}
