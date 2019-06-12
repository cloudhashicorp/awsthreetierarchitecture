# AMI RHEL 8: ami-098bb5d92c8886ca1
resource "aws_launch_configuration" "app-lc" {

    name                       = "App_Launch_Config"
    image_id                   = "${var.amis}"
    instance_type              = "${var.instance_type_internal}"
    security_groups            = [
                                 "${var.output_internal_alb_sg}",
                                 "${var.output_bastion_ssh}",
                                  ]


    key_name                   = "myec2key"
  
}

output "app_lc_name" {
  value = "${aws_launch_configuration.app-lc.name}"
}