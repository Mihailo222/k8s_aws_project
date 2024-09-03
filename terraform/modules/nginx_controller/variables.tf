variable "name" {
description = "Chart name."
type = string
default = ""
}

variable "repository" {
description = "Repository name."
type = string
default = ""
}

variable "chart" {
description = "Chart name."
type = string
default = ""
}

variable "namespace" {
description = "Nemaspace"
type = string
default = ""
}

variable "variable_from_tfvars" {
description = "Variables from tfvars."
type = string
}