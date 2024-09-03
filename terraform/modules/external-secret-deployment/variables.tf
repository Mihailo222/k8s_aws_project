variable "external_secret_name" {
description = "External secret name."
type = string
default="exampleexternalsecret"
}

variable "secret_store_name" {
description = "Secret store name."
type = string
default="secretstore-sample" //depends on preko secret store name-a 
}

variable "new-secret" {
description = "Newlly generated secret name."
type = string
default="kube-secret"
}

variable "secret_manager_secret_name" {
description = "Secret name."
type=string
default="" //depends on preko secret managera
}

variable "depends_on_one" {
  description = "Dependency one. "
  type = any
  default = ""
}

variable "depends_on_two" {
  description = "Dependency two." 
  type = any
  default = ""
}

variable "variables_from_tfvars" {
  description = "Variables from tfvars."
  type = string
}