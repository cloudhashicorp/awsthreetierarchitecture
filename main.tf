provider "aws" {
    region     = "${var.region}"
    access_key = "${var.access_key_id}"
    secret_key = "${var.secret_access_key_id}"
}


module "site" {
  source = "./site"
 
  
}

module "load_balancers" {
  source          = "./load_balancers"

  public_subnet1  = "${module.site.outputpublicsubnet1}"
  public_subnet2  = "${module.site.outputpublicsubnet2}"
  private_subnet3 = "${module.site.outputprivatesubnet3}"
  private_subnet4 = "${module.site.outputprivatesubnet4}"
  vpc_id          = "${module.site.output_vpc_id}"
  external_alb_sg = "${module.site.output_external_alb_sg}"
  internal_alb_sg = "${module.site.output_internal_alb_sg}"
 
  
}

module "autoscaling_groups" {
  source            = "./autoscaling_groups"
  web_launch_config = "${module.launch_configurations.web_lc_name}"
  app_launch_config = "${module.launch_configurations.app_lc_name}"
  # web_loadbalancer  = "${module.load_balancers.output_albweb}" This may not be needed
  public_subnet1    = "${module.site.outputpublicsubnet1}"
  public_subnet2    = "${module.site.outputpublicsubnet2}"
  private_subnet3   = "${module.site.outputprivatesubnet3}"
  private_subnet4   = "${module.site.outputprivatesubnet4}"
  out_tg_instances  = "${module.load_balancers.out_tg_instances}"
  internaltg        = "${module.load_balancers.internaltg}"
}

module "launch_configurations" {
  source                  = "./launch_configurations"
  output_web_sg           = "${module.site.output_web_sg}"
  external_alb_sg         = "${module.site.output_external_alb_sg}"
  output_bastion_ssh      = "${module.site.output_bastion_ssh}"
  output_internal_alb_sg  = "${module.site.output_internal_alb_sg}"

}

module "ec2_instances" {
  source                      = "./ec2_instances"
  public_subnet1              = "${module.site.outputpublicsubnet1}"
  private_subnet3             = "${module.site.outputprivatesubnet3}"
  private_subnet4             = "${module.site.outputprivatesubnet4}"
  output_bastion_ssh          = "${module.site.output_bastion_ssh}"
  web_access_from_nat_prv_sg  = "${module.site.web_access_from_nat_prv_sg}"
  web_access_from_nat_pub_sg  = "${module.site.web_access_from_nat_pub_sg}"
  
}


module "databases" {
  source                      = "./databases"
  private_subnet3             = "${module.site.outputprivatesubnet3}"
  private_subnet4             = "${module.site.outputprivatesubnet4}"
  out_rdssubnetgroup          = "${module.site.out_rdssubnetgroup}"
  rdsmysqlsg                  = "${module.site.rdsmysqlsg}"
  
}




