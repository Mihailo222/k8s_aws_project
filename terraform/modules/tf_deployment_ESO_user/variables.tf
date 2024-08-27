variable "username_for_secrets_reader_user" {
  description = "User with premissions for reading secrets."
  type = string
  default = "aws_secrets_manager_user_mihailo"
}

variable "user_policy_name" {
  description = "Policy name for user accessing AWS secrets manager."
  type = string
  default = "userpolicymihailo"
}

variable "secrets_name" {
  description = "Secret name from secret manager"
  type = string
  default = "" //import from additional module
}

variable "region" {
  description = "Region for storing resources on AWS"
  type = string
  default = "eu-central-1"
}

variable "account_id" {
  description = "ID of the user with grants to access s3 bucket"
  type = string
  default=""
}


