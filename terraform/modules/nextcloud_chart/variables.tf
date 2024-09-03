variable "helm_release" {
  description = "Name of release."
  type = string
  default = "nextcloud" //future name of nextcloud service 
}

variable "helm_repository" {
  description = "Helm repository."
  type = string
  default = "https://nextcloud.github.io/helm/"
}

variable "chart" {
  description = "Chart name."
  type = string
  default = "nextcloud"
}

variable "version" {
  description = "Helm chart version"
  type = string
  default = "5.5.2"
}

variable "nextcloud_name" {
  description = "Name of nextcloud user."
  type = string
  default = "nextcloud"
}

variable "nextcloud_passwd" {
  description = "Password of nextcloud user."
  type = string
  default = "Admin123!"
}
