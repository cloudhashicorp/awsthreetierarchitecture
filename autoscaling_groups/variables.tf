variable "asg_max" {

    default = "3"
  
}

variable "asg_min" {
    
    default = "2"
}

variable "web_launch_config" {}
# variable "web_loadbalancer" {} This may not be needed
variable "app_launch_config" {}
variable "out_tg_instances" {}
variable "internaltg" {}



variable "public_subnet1" {}
variable "public_subnet2" {}
variable "private_subnet3" {}

variable "private_subnet4" {}





