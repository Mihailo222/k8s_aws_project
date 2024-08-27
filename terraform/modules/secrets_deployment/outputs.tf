output "secrets_name" {
  description = "Secret name from secret manager"
  value = aws_secretsmanager_secret.mysql_db.name
}