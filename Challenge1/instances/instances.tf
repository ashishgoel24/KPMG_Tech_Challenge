resource "aws_instance" "bastion" {
    ami  = var.amis
    instance_type = var.instance_type
    subnet_id  = var.public_subnet1
    associate_public_ip_address = true
    key_name = "myinstancekey"
    vpc_security_group_ids = [var.output_bastion_ssh]
    tags = {
        Name = "Bastion_Test"
    }
}

resource "aws_eip" "bastion_eip" {
    instance = aws_instance.bastion.id
    vpc = true
}

resource "aws_instance" "prv_sub_1_instance" {
    ami = var.amis
    instance_type = var.instance_type
    subnet_id = var.private_subnet1
    key_name = "myinstancekey"
    vpc_security_group_ids = [
                                  var.output_bastion_ssh,
                                  var.web_access_from_nat_prv_sg
    ]
    tags = {
        Name = "Prv 1 Instance"
    }
}

resource "aws_instance" "prv_sub_2_instance" {
    ami = var.amis
    instance_type = var.instance_type
    subnet_id = var.private_subnet2
    key_name = "myinstancekey"
    vpc_security_group_ids = [
                                  var.output_bastion_ssh,
                                  var.web_access_from_nat_prv_sg
    ]
    tags = {
        Name = "Prv 2 Instance"
    }
}