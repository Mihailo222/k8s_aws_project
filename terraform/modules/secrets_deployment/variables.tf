variable "db_endpoint" {
    description = "RDS instance endpoint"
    type = string
    default = "database-mihailo.cscjwnksxo6a.eu-central-1.rds.amazonaws.com" //input from module creating rds instance
}

variable "db_user" {
    description = "RDS instance user"
    type = string
    default = "test-user" //input from module creating rds instance  
}

variable "db_password" {
    description = "RDS instance password"
    type = string
    default = "test-pwd" //input from module creating rds instance
  
}

variable "db_database_name" {
    description = "RDS instance database name"
    type = string
    default = "test-db" //input from module creating rds instance
}

variable "secret_name" {
  description = "Name of a secret storing db credentials."
  type = string
  default = "mihailo_test_secret"
}

variable "secret_description" {
  description = "Description of a secret created."
  type = string
  default = "Test secret."
}

variable "variables_from_tfvars" {
  description = "Variables imported from .tfvars file"
  type = string
}