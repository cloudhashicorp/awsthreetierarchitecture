variable "amis" {
    
    default = "ami-0c6b1d09930fac512"
  
}

# RHEL ami: ami-098bb5d92c8886ca1 

variable "instance_type" {

    default = "t2.micro"
  
}

variable "instance_type_internal" {

    default = "t2.medium"
  
}

variable "output_web_sg" {} 
variable "external_alb_sg" {} 
variable "output_bastion_ssh" {}   
variable "output_internal_alb_sg" {}

