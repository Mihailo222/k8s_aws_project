variable "region" {
  description = "Region for resource deployment..."
  type = string
  default = ""
}

variable "cluster_oidc_id" {
  description = "Cluster OIDC ID."
  type = string
  default = ""
}

variable "namespace_r53" {
  description = "Namespace for resource deployment."
  type = string
  default = ""
}

variable "service_account_name_r53" {
  description = "Service account name."
  type = string
  default=""
}
variable "iam_role_name" {
  description = "IAM role  for Route 53 access name."
  type = string
  default = ""
}

variable "academy_zone_id" {
  description = "ID of a hosted zone we want to give EKS premissions to."
  type = string
  default = ""
}

variable "account_id" {
  description = "Id of a user accessing to route53."
  type = string
  default = ""
}
/*
variable "variable_from_tfvars" {
  description = "Variables from tfvars."
  default = ""
}*/