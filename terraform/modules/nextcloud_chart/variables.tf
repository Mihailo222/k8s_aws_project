variable "helm_release" {
  description = "Name of release."
  type = string
  default = "" //future name of nextcloud service 
}

variable "helm_repository" {
  description = "Helm repository."
  type = string
  default = ""
}

variable "chart" {
  description = "Chart name."
  type = string
  default = ""
}

variable "version_nextcloud" {
  description = "Helm chart version"
  type = string
  default = ""
}
#-------------------------Chart values.yaml variables-------------------------------------------------

variable "bucket_name" {
  description = "S3 bucket name."
  type = string
  default = ""
}

variable "nextcloud_username" {
  description = "Nextcloud username."
  type = string
  default = ""
}

variable "nextcloud_password" {
  description = "Nextcloud password."
  type = string
  default = ""
}

variable "db_secret_name" {
  description = "Secret name for db creds secret."
  type = string
  default = ""
}

variable "hostKey" {
  description = "Key value for host storing into secret."
  type = string
  default = ""
}

variable "usernameKey" {
  description = "Key value for username storing into secret."
  type = string
  default = ""
}

variable "passwdKey" {
  description = "Key value for passwd storing into secret."
  type = string
  default = ""
}

variable "databaseKey" {
  description = "Key value for database storing into secret."
  type = string
  default = ""
}

variable "hostValue" {
  description = " value for host storing into secret."
  type = string
  default = ""
}

variable "usernameValue" {
  description = " value for username storing into secret."
  type = string
  default = ""
}


variable "passwdValue" {
  description = "value for passwd storing into secret."
  type = string
  default = ""
}


variable "dbValue" {
  description = "value for db storing into secret."
  type = string
  default = ""
}


variable "redis_storage_class" {
  description = "Key value for host storing into secret."
  type = string
  default = ""
}




