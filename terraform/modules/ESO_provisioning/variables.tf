variable "helm_repo_name" {
  description = "Name of helm repository."
  type = string
  default = ""
}

variable "helm_release_name" {
  description = "Release name."
  type = string
  default = ""
}

variable "helm_release_chart" {
  description = "Chart name."
  type = string
  default = ""
}

/*variable "variables_from_tfvars" {
  description = "Variables from tfvars file"
  type = string
}*/
