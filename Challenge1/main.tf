provider "aws" {
    region     = var.region
    profile = var.aws_profile
}

module "vpc" {
  source = "./vpc"
}

module "loadbalancer" {
  source = "./loadbalancer"
  public_subnet1  = module.vpc.outputpublicsubnet1
  public_subnet2  = module.vpc.outputpublicsubnet2
  private_subnet1 = module.vpc.outputprivatesubnet1
  private_subnet2 = module.vpc.outputprivatesubnet2
  vpc_id  = module.vpc.output_vpc_id
  external_alb_sg = module.vpc.output_external_alb_sg
  internal_alb_sg = module.vpc.output_internal_alb_sg
}

module "autoscalinggroup" {
  source = "./autoscalinggroup"
  web_launch_config = module.launchconfig.web_lc_name
  app_launch_config = module.launchconfig.app_lc_name
  public_subnet1 = module.vpc.outputpublicsubnet1
  public_subnet2 = module.vpc.outputpublicsubnet2
  private_subnet1 = module.vpc.outputprivatesubnet1
  private_subnet2 = module.vpc.outputprivatesubnet2
  out_tg_instances = module.loadbalancer.out_tg_instances
  internaltg = module.loadbalancer.internaltg
}

module "launchconfig" {
  source = "./launchconfig"
  output_web_sg = module.vpc.output_web_sg
  external_alb_sg = module.vpc.output_external_alb_sg
  output_bastion_ssh = module.vpc.output_bastion_ssh
  output_internal_alb_sg = module.vpc.output_internal_alb_sg
}

module "instances" {
  source = "./instances"
  public_subnet1  = module.vpc.outputpublicsubnet1
  private_subnet1 = module.vpc.outputprivatesubnet1
  private_subnet2 = module.vpc.outputprivatesubnet2
  output_bastion_ssh = module.vpc.output_bastion_ssh
  web_access_from_nat_prv_sg = module.vpc.web_access_from_nat_prv_sg
  web_access_from_nat_pub_sg = module.vpc.web_access_from_nat_pub_sg
}

module "db_instance" {
  source = "./db_instance"
  private_subnet1 = module.vpc.outputprivatesubnet1
  private_subnet2 = module.vpc.outputprivatesubnet2
  out_rdssubnetgroup = module.vpc.out_rdssubnetgroup
  rdsmysqlsg = module.vpc.rdsmysqlsg
}