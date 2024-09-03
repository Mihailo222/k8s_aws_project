variable "subnet_group_name" {
  description = "Subnet group name for rds instance."
  type = string
  default = ""
}

variable "subnet_one" {
  description = "Subnet 1 from the same VPC, but different availability zone."
  type = string
  default = "" 
}

variable "subnet_two" {
  description = "Subnet 2 from the same VPC, but different availability zone."
  type = string
  default = "" 
}

variable "vpc" {
 description = "DB VPC" 
 type = string
 default = ""
}


variable "db_name" {
    description = "Name for database on this instance."
    type = string
    default = ""
}

variable "db_username" {
    description = "DB username"
    type = string
    default = ""
}

variable "db_passwd" {
    description = "DB passwd"
    type = string
    default = ""
}

variable "eks_sg1" {
  description = "EKS Cluster Security Group 1"
  type = string
  default = ""
}
variable "eks_sg2" {
  description = "EKS Cluster Security Group 2"
  type = string
  default = ""
}

variable "db_sg_name" {
  description = "Name for security group for db instance."
  type = string
  default = ""
}

variable "engine" {
  description = "Engine Type."
  type = string
  default = ""
}

variable "engine_version" {
  description = "Engine version"
  type = string
  default = ""
}

variable "instance_class" {
  description = "Instance class"
  type = string
  default = ""
}

variable "allocated_storage" {
  description = "Allocated storage"
  type = number
  default = 20
}

variable "variables_from_tfvars" {
  description = ".tfvars file"
  type = string
}