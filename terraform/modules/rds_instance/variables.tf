variable "subnet_group_name" {
  description = "Subnet group name for rds instance."
  type = string
  default = "dbsubnetgroup1"
}

variable "subnet_one" {
  description = "Subnet 1 from the same VPC, but different availability zone."
  type = string
  default = "subnet-0c988bbc1a2d11109" 
}

variable "subnet_two" {
  description = "Subnet 2 from the same VPC, but different availability zone."
  type = string
  default = "subnet-0c43693d56d99314e" 
}

variable "vpc" {
 description = "DB VPC" 
 type = string
 default = "vpc-0769af89e3dff6849"
}


variable "db_name" {
    description = "Name for database on this instance."
    type = string
    default = "nextcloud"
}

variable "db_username" {
    description = "DB username"
    type = string
    default = "admin"
}

variable "db_passwd" {
    description = "DB passwd"
    type = string
    default = "admin12345!"
}

variable "eks_sg1" {
  description = "EKS Cluster Security Group 1"
  type = string
  default = "sg-042b9774cd276534b"
}
variable "eks_sg2" {
  description = "EKS Cluster Security Group 2"
  type = string
  default = "sg-02d2697f6a051b76d"
}

variable "db_sg_name" {
  description = "Name for security group for db instance."
  type = string
  default = "db_sg"
}
