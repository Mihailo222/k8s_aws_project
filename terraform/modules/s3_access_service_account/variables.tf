variable "service_account_name" {
  description = "Service account name"
  type = string
  default = "futureserviceaccount"
  
}

variable "namespace_s3" {
    description = "Service account namespace."
    type = string
    default = "default"
}

variable "s3_access_role_name" {
  description = "S3 access role name"
  type = string
  default = "" //depends on
}

variable "user_id" {
  description = "AWS user id."
  type = string
  default = ""
}
/*
variable "variables_from_tfvars" {
  description = "Variables from tfvars."
  type = string
}*/