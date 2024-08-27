output "rds_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.rds_db.endpoint
}

output "rds_user" {
  description = "The user of the RDS instance"
  value       = aws_db_instance.rds_db.username
}


output "rds_password" {
  description = "The password of the RDS instance"
  value       = aws_db_instance.rds_db.password
}


output "rds_db_name" {
  description = "The name of the RDS instance"
  value       = aws_db_instance.rds_db.db_name
}


