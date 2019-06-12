resource "aws_autoscaling_group" "appasg" {

    name                 = "appautoscalinggroup"
    max_size             = "${var.asg_max}"
    min_size             = "${var.asg_min}"
    launch_configuration = "${var.app_launch_config}"
    target_group_arns    = ["${var.internaltg}"]
    force_delete         = true
    vpc_zone_identifier  = ["${var.private_subnet3}","${var.private_subnet4}"]

    ### Added to see if this will work
    health_check_type    = "EC2"
    health_check_grace_period = 300


  
}