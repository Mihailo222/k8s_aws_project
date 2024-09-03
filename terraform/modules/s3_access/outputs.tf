output "role_name" {
  description = "S3 bucket's name."
  value = aws_iam_role.s3-role.name
}