resource "aws_lb" "netlbapp" {

    name               = "App-Network-Load-Balancer"
    load_balancer_type = "network"
    internal           = true
    subnets            = ["${var.private_subnet3}", "${var.private_subnet4}"] 
    enable_deletion_protection = true
    tags               = {
        
    Environment        = "INTERNAL Network Load Balancer"
    }
  
}

output "output_netlbapp" {
  value = "${aws_lb.netlbapp.arn}"
}

resource "aws_lb_target_group" "internaltg" {
    name                = "IP-lb-instancetype-internal-tg"
    port                = 3000
    protocol            = "TCP"
    target_type         = "instance"
    vpc_id              = "${var.vpc_id}"
    
}

output "internaltg" {  # to register the instance in the ALB
  value = "${aws_lb_target_group.internaltg.arn}"
}


resource "aws_lb_listener" "internal_listener_app" {

    load_balancer_arn = "${aws_lb.netlbapp.arn}"
    port              = "3000"
    protocol          = "TCP"

    default_action {
    type              = "forward"
    target_group_arn  = "${aws_lb_target_group.internaltg.arn}"  
    }
  
}