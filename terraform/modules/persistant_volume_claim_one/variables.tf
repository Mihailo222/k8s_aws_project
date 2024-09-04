variable "pv_name" {
  description = "Persistant volume name."
  type = string
  default = ""
}

variable "access_mode" {
  description = "PV Access Mode."
  type = string
  default = ""
}

variable "storage" {
  description = "PV's storage capacity."
  type = string
  default = ""
}

variable "driver" {
  description = "AWS EBS driver."
  type = string
  default = ""
}

variable "volume_handle" {
  description = "Volume ID from AWS EBS volume."
  type = string
  default = "" //depends on
}

variable "storage_class_name" {
  description = "Name of the storage class."
  type = string
  default = "" 
}

variable "persistent_volume_reclaim_policy" {
  description = "Persistent volume's reclaim policy."
  type = string
  default = ""
}

