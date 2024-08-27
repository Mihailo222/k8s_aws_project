variable "region" {
  description = "Region for resource deployment"
  type = string
  default = "eu-central-1"
}
variable "cluster_oidc_id" {
  description = "OIDC ID"
  type = string
  default = "https://oidc.eks.eu-central-1.amazonaws.com/id/9BF18955F2CB5DB9D497C2A7C24367DB"
}

variable "namespace" {
  description = "Namespace for resource deployment"
  type = string
  default = "default"
}

variable "service_account_name" {
  description = "Name for future service account."
  type = string
  default="futureserviceaccount" //will be created in the future
}

variable "account_id" {
  description = "ID of IAM user."
  type = string
  default = "976552365380"

}

variable "bucket_name" {
  description = "Nextcloud S3 bucket name"
  type = string
  default = "mihailo-s3-bucket-test"

}

variable "access_role4_s3_bucket" {
  description = "Access role for s3 bucket"
  type = string
  default = "mihailo-s3-access-role-for-helmchart"
}