resource "aws_db_instance" "rds_test" {
    allocated_storage = 50
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "8.0.28"
    instance_class = "db.t3.large"
    name = "myrds_test"
    username = "admin"
    password = "password123"
    multi_az = true
    port = 3306
    db_subnet_group_name = var.out_rdssubnetgroup
    vpc_security_group_ids = [var.rdsmysqlsg]
    tags = {
        Name = "RDS MySQL Test"
    }
}