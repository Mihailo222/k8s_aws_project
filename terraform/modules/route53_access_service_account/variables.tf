variable "service_account_name" {
  description = "Service account name"
  type = string
  default = "" 
}

variable "service_account_namespace" {
    description = "Service account namespace."
    type = string
    default = ""
}

variable "r53_access_role_name" {
  description = "Route 53 access role name"
  type = string
  default = "" //depends on
}

variable "user_id" {
  description = "AWS user id."
  type = string
  default = ""
}

/*variable "variables_from_tfvars" {
  description = "Variables from tfvars."
  type = string
}*/