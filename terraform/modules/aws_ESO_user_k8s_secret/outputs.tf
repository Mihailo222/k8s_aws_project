output "access_key_key" {
  description = "Access key of Secrets Manager IAM user"
  value = "${var.access_key_key}"
}

output "secret_access_key_key" {
  description = "Secret access key of Secrets Manager IAM user."
  value = "${var.secret_access_key_key}"
}

output "secrets_name" {
  description = "Name of the secret."
  value = "${var.secrets_name}"
}

