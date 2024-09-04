variable "eks_node_group_role" {
  description = "Role for EKS cluster's nodes to authenticate."
  type = string
  default = ""
}

variable "account_id" {
  description = "AWS user's account ID."
  type = string
  default = ""
}

/*variable "variables_from_tfvars" {
  description = "Variables from .tfvars file"
  type = string
}*/