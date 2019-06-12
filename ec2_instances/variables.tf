# EC2 Instances
variable "amis" {
    
    default = "ami-0c6b1d09930fac512"
  
}

# RHEL ami: ami-098bb5d92c8886ca1 

variable "instance_type" {

    default = "t2.nano"
  
}

variable "public_subnet1" {}
variable "output_bastion_ssh" {}
variable "private_subnet3" {}
variable "private_subnet4" {}
variable "web_access_from_nat_prv_sg" {}
variable "web_access_from_nat_pub_sg" {}





