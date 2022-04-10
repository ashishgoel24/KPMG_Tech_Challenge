resource "aws_autoscaling_group" "appautoscalinggroup" {
    name = "appautoscalinggroup"
    max_size = var.autoscalinggroup_max
    min_size = var.autoscalinggroup_min
    launch_configuration = var.app_launch_config
    target_group_arns = ["var.internaltg"]
    force_delete = true
    vpc_zone_identifier = ["var.private_subnet1","var.private_subnet2"]
    health_check_type = "EC2"
    health_check_grace_period = 300
}