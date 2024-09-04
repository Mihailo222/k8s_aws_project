variable "ebs_size" {
  description = "EBS volume for persistent volumes on EKS"
  type = number
  default = 10
}

variable "az" {
  description = "Availability zone for our resources."
  type = string
  default = ""
}
/*
variable "variables_from_tfvars" {
  description = "Variables from tfvars."
  type = string
}*/