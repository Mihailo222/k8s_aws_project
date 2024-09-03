variable "name" {
  description = "Name  of a ingress resource"
  type = string
  default = "nginx-ingress"
}

variable "namespace" {
  description = "Namespace for ingress resource"
  type = string
  default = "default"
}

variable "ingress_class_name" {
  description = "Ingress class name."
  type = string
  default = "nginx"
}

variable "host" {
  description = "Host."
  type = string
  default = "mydomain1.academy.cyberlab.rs"
}

variable "path" {
  description = "Path for a specific domain."
  type = string
  default = "/"
}

variable "service_name" {
  description = "Name of the pod service running nextcloud release."
  type = string
  default = "" //depends on
}

variable "service_port" {
  description = "Port of a running service we want to commmunicate to."
  type = number
  default = 8080
}

variable "variable_from_tfvars" {
  description = "Variables from tfvars"
  type = string
}





















