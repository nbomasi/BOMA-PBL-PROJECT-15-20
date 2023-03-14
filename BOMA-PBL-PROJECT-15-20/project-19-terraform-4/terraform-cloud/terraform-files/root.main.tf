module "VPC" {
  source               = "./modules/VPC"
  region               = var.region
  vpc_cidr             = var.vpc_cidr
  #access_ip            = var.access_ip
  environment          = var.environment
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_support
  #destination_cidr_block              = var.access_ip
  preferred_number_of_public_subnets  = var.preferred_number_of_public_subnets
  preferred_number_of_private_subnets = var.preferred_number_of_private_subnets
  public_subnets                      = [for i in range(2, 255, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
  private_subnets                     = [for i in range(1, 255, 2) : cidrsubnet(var.vpc_cidr, 8, i)]
}

# SECURITY MODULE
module "security" {
  source = "./modules/security"
  vpc_id = module.VPC.vpc_id
}

# Autoscaling module takes care of ami image, templates and all boostrapping/userdata
module "AutoScaling" {
  source            = "./modules/autoscaling"
  ami-web           = var.ami-web
  ami-bastion       = var.ami-bastion
  ami-nginx         = var.ami-nginx
  ami-ubuntu        = var.ami-ubuntu
  desired_capacity  = 1
  min_size          = 1
  max_size          = 2
  web-sg            = [module.security.web-sg]
  bastion-sg        = [module.security.bastion-sg]
  nginx-sg          = [module.security.nginx-sg]
  wordpress-alb-tgt = module.ALB.wordpress-tgt
  nginx-alb-tgt     = module.ALB.nginx-tgt
  tooling-alb-tgt   = module.ALB.tooling-tgt
  instance_profile  = module.VPC.instance_profile
  public_subnets    = [module.VPC.public_subnet-1, module.VPC.public_subnet-2]
  private_subnets   = [module.VPC.private_subnet-1, module.VPC.private_subnet-2]
  keypair           = var.keypair
}

module "ALB" {
  source             = "./modules/ALB"
  ip_address_type    = "ipv4"
  load_balancer_type = "application"
  vpc_id             = module.VPC.vpc_id
  private_sg         = module.security.IALB-sg
  public_sg          = module.security.ALB-sg
  public_subnet-1    = module.VPC.public_subnet-1
  public_subnet-2    = module.VPC.public_subnet-2
  private_subnet-1   = module.VPC.private_subnet-1
  private_subnet-2   = module.VPC.private_subnet-2
}

module "RDS" {
  source                 = "./modules/RDS"
  environment = var.environment
  master-username        = var.master-username
  master-password        = var.master-password
  db-username = var.db-username
  private_subnet-3      = module.VPC.private_subnet-3
  private_subnet-4      = module.VPC.private_subnet-4
  vpc_security_group_ids = module.security.datalayer-sg
}

module "EFS" {
  source              = "./modules/EFS"
  efs1_subnet_id      = module.VPC.private_subnet-1
  efs2_subnet_id      = module.VPC.private_subnet-2
  efs_security_groups = module.security.datalayer-sg
  account_no = var.account_no
}

# # The Module creates instances for jenkins, sonarqube abd jfrog
# module "compute" {
#   source          = "./modules/compute"
#   ami-jenkins     = var.ami-jenkins
#   ami-sonar       = var.ami-sonar
#   ami-jfrog       = var.ami-jfrog
#   subnets-compute = module.VPC.public_subnet-1
#   sg-compute      = [module.security.ALB-sg]
#   keypair         = var.keypair
# }



  