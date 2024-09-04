variable "secret_store_name" {
description = "Secret store name."
type = string
default = ""
}

variable "region" {
description = "Region of deployed secrets manager."
type = string
default = ""
}


variable "access_key" { //depends on  
description = "Key value of access key stored in secrets manager on AWS."
type = string
default = "" 
}


variable "secret_access_key" { //depends on 
description = "Key value of secret access key stored in secrets manager on AWS."
type = string
default = ""
}

variable "aws_auth_secret" {
description = "Secret where AWS IAM user credentials are stored."
type = string
default = "" //depends on 
}
variable "secret_store_namespace" {
  description = "SS namespace."
  type = any
  default = ""
}
