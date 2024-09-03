variable "region" {
  description = "Region for resource deployment"
  type = string
  default = ""
}
variable "cluster_oidc_id" {
  description = "OIDC ID"
  type = string
  default = ""
}

variable "namespace" {
  description = "Namespace for resource deployment"
  type = string
  default = ""
}

variable "service_account_name" {
  description = "Name for future service account."
  type = string
  default="" //will be created in the future
}

variable "account_id" {
  description = "ID of IAM user."
  type = string
  default = ""

}

variable "bucket_name" {
  description = "Nextcloud S3 bucket name"
  type = string
  default = ""

}

variable "access_role4_s3_bucket" {
  description = "Access role for s3 bucket"
  type = string
  default = ""
}

variable "variable_from_tfvars" {
  description = "Variable from tfvars."
  type = string
}