variable "vpc_cdir_block" {
    default = "10.0.0.0/16"
}

variable "AZ1" {
    default = "us-east-1a"
}

variable "AZ2" {
    default = "us-east-1b"
}

variable "public_subnet_1" {
    default = "10.0.1.0/24"
}

variable "public_subnet_2" {
    default = "10.0.2.0/24"
}

variable "private_subnet_1" {
    default = "10.0.3.0/24"
}

variable "private_subnet_2" {
    default = "10.0.4.0/24"
}

variable "any_ip" {
    default = "0.0.0.0/0"
}