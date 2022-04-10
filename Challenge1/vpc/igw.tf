resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.vpctest.id
    tags = {
        Name = "Internet Gateway Test"
    }
}