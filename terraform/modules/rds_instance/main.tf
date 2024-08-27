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

resource "aws_db_instance" "rds_db" {
   allocated_storage = 20
  db_name              = "${var.db_name}"
  engine               = "mysql"
  engine_version       = "8.0.35"
  instance_class       = "db.m5d.large"
  username             = "${var.db_username}"
  password             = "${var.db_username}"
  skip_final_snapshot = true  
  
  db_subnet_group_name = aws_db_subnet_group.subnet_group.name 
  vpc_security_group_ids = [aws_security_group.db_sg.id]  
}

