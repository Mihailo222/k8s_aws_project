variable "user_access_key" {
    description = "Access key of IAM user."
    type = string
    default = ""  //depends on
}

variable "user_secret_access_key" {
  description = "Secret access key of IAM user."
  type = string
  default = "" //depends on
}

variable "secrets_name" {
    description = "Name of the secret."
    type = string
    default = ""  
}

variable "access_key_key" {
   description = "Key value for Secrets Manager AWS IAM user access key."
   type = string
   default = ""
}

variable "secret_access_key_key" {
   description = "Key value for Secrets Manager AWS IAM user secret access key."
   type = string
   default = ""
}
/*
variable "variables_from_tfvars" {
  description = "Variables from tfvars file"
  type = string
}*/