variable "autoscalinggroup_max" {
    default = "3"
}

variable "autoscalinggroup_min" {
    default = "2"
}

variable "web_launch_config" {}
variable "app_launch_config" {}
variable "out_tg_instances" {}
variable "internaltg" {}

variable "public_subnet1" {}
variable "public_subnet2" {}
variable "private_subnet1" {}
variable "private_subnet2" {}
