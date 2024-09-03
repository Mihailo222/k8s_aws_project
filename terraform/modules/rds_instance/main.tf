#import security groups from EKS cluster
data "aws_security_group" "eks_sg1" {
id = "${var.eks_sg1}"
}
data "aws_security_group" "eks_sg2" {
id = "${var.eks_sg2}"
}

resource "aws_db_subnet_group" "subnet_group" {
  name       = "${var.subnet_group_name}"
  subnet_ids = ["${var.subnet_one}","${var.subnet_two}"] 

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_security_group" "db_sg" {
  name        = "${var.db_sg_name}"
  description = "Security group for my ec2 access to db"
 
  vpc_id = "${var.vpc}"
  
  ingress {
    from_port   =  3306
    to_port     =  3306
    protocol    = "tcp" 
    security_groups = [ data.aws_security_group.eks_sg1.id, data.aws_security_group.eks_sg2.id ]  
  }
 
}

resource "aws_db_parameter_group" "example" {
  name   = "my-pg"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_db_instance" "rds_db" {

  allocated_storage = "${var.allocated_storage}"
  db_name              = "${var.db_name}"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  
  username             = "${var.db_username}"
  password             = "${var.db_username}"
  
  skip_final_snapshot = true  

  apply_immediately = true
  allow_major_version_upgrade = true
  auto_minor_version_upgrade = false

  
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name 
  vpc_security_group_ids = [aws_security_group.db_sg.id]  
}

