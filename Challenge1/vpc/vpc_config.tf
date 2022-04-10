resource "aws_vpc" "vpctest" {
    cidr_block = var.vpc_cdir_block
    tags = {
        Name = "VPC Test"
    }
}
output "output_vpc_id" {
  value = aws_vpc.vpctest.id
}

resource "aws_subnet" "publicsubnet1" {
    vpc_id = aws_vpc.vpctest.id
    cidr_block = var.public_subnet_1
    availability_zone = var.AZ1
    tags = {
        Name = "Public Subnet-1 Test"
    }
}

output "outputpublicsubnet1" {
  value = aws_subnet.publicsubnet1.id
}

resource "aws_subnet" "publicsubnet2" {
    vpc_id = aws_vpc.vpctest.id
    cidr_block = var.public_subnet_2
    availability_zone = var.AZ2
    tags = {
        Name = "Public Subnet-2 Test"
    }
}

output "outputpublicsubnet2" {
  value = aws_subnet.publicsubnet2.id
}

resource "aws_subnet" "privatesubnet1" {
    vpc_id = aws_vpc.vpctest.id
    cidr_block = var.private_subnet_1
    availability_zone = var.AZ1
    tags = {
        Name = "Private Subnet-1 Test"
    }
}

output "outputprivatesubnet1" {
  value = aws_subnet.privatesubnet1.id
}

resource "aws_subnet" "privatesubnet2" {
    vpc_id = aws_vpc.vpctest.id
    cidr_block = var.private_subnet_2
    availability_zone = var.AZ2
    tags = {
        Name = "Private Subnet-2 Test"
    }
}

output "outputprivatesubnet2" {
  value = aws_subnet.privatesubnet2.id
}

resource "aws_db_subnet_group" "rdsubnetgroup" {
    name = "rds_subnet_group"
    subnet_ids = [aws_subnet.privatesubnet1.id, aws_subnet.privatesubnet2.id]
    tags = {
        Name = "My RDS Subnet Group"
    }
}

output "out_rdssubnetgroup" {
  value = aws_db_subnet_group.rdsubnetgroup.id
}