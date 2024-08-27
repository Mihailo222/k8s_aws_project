variable "region" {
  description = "Region for resource deployment..."
  type = string
  default = "eu-central-1"
}

variable "cluster_oidc_id" {
  description = "Cluster OIDC ID."
  type = string
  default = "https://oidc.eks.eu-central-1.amazonaws.com/id/2E5778C6EBF10ACE8AA57B0CDEED4A14"
}

variable "namespace" {
  description = "Namespace for resource deployment."
  type = string
  default = "default"
}

variable "service_account_name" {
  description = "Service account name."
  type = string
  default="myfutuerroute53serviceaccount"
}
variable "iam_role_name" {
  description = "IAM role  for Route 53 access name."
  type = string
  default = "mihailo-route53-access-role-for-helmchart"
}

variable "academy_zone_id" {
  description = "ID of a hosted zone we want to give EKS premissions to."
  type = string
  default = "Z03249243ME4HRRZCZL1P"
}

variable "account_id" {
  description = "Id of a user accessing to route53."
  type = string
  default = ""
}