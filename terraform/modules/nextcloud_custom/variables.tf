variable "helm_release" {
  description = "Name of release."
  type = string
  default = "" //future name of nextcloud service 
}

variable "chart_version" {
  description = "Chart version."
  type = string
  default = ""
}

variable "path_to_the_chart" {
  description = "Path to the chart folder."
  type = string
  default = ""
}

variable "variable_from_tfvars" {
  description = "Variables for import from tfvars."
  type = string
}
