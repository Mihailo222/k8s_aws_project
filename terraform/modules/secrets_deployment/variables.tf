variable "db_endpoint" {
    description = "RDS instance endpoint"
    type = string
    default = "" //input from module creating rds instance
}

variable "db_user" {
    description = "RDS instance user"
    type = string
    default = "" //input from module creating rds instance  
}

variable "db_password" {
    description = "RDS instance password"
    type = string
    default = "" //input from module creating rds instance
  
}

variable "db_database_name" {
    description = "RDS instance database name"
    type = string
    default = "" //input from module creating rds instance
}

variable "secret_name" {
  description = "Name of a secret storing db credentials."
  type = string
  default = "mihailo_nextcloud_secrets"
}

variable "secret_description" {
  description = "Description of a secret created."
  type = string
  default = "This is secret for storing database credentials."
}



