output "access_key_id" {
  description = "The access key ID for the IAM user."
  value       = aws_iam_access_key.user_access_key.id
}

output "secret_access_key" {
  description = "The secret access key for the IAM user."
  value       = aws_iam_access_key.user_access_key.secret
  sensitive   = true
}