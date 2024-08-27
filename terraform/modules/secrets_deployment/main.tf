resource "aws_secretsmanager_secret" "mysql_db" {  
  name = "${var.secret_name}"  
  description = "${var.secret_description}"
}

resource "aws_secretsmanager_secret_version" "db_mysql_values" { 
  secret_id     = aws_secretsmanager_secret.mysql_db.id
  secret_string = jsonencode({
    host = "${var.db_endpoint}",
    user = "${var.db_user}",
    password = "${var.db_password}",
    database="${var.db_database_name}"
  })
}
