variable "amis" {
    default = "ami-0c6b1d09930fac512"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "public_subnet1" {}
variable "private_subnet1" {}
variable "private_subnet2" {}

variable "output_bastion_ssh" {}

variable "web_access_from_nat_prv_sg" {}
variable "web_access_from_nat_pub_sg" {}