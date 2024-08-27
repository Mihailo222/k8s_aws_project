resource "aws_iam_user" "user" {
  name = "${var.username_for_secrets_reader_user}"
}

resource "aws_iam_access_key" "user_access_key" { 
  user = aws_iam_user.user.name
}

data "aws_iam_policy_document" "user_policy" {
  statement {
    effect    = "Allow"
    actions   = [
    "secretsmanager:GetRandomPassword",
    "secretsmanager:GetResourcePolicy",
    "secretsmanager:GetSecretValue",
    "secretsmanager:DescribeSecret",
    "secretsmanager:ListSecretVersionIds",
    "secretsmanager:ListSecrets",
    "secretsmanager:BatchGetSecretValue"
    ]
    resources = ["arn:aws:secretsmanager:${var.region}:${var.account_id}:secret:${var.secrets_name}*"]
  }
}

resource "aws_iam_user_policy" "user_policy_association" {
  name   = "${var.user_policy_name}"
  user   = aws_iam_user.user.name
  policy = data.aws_iam_policy_document.user_policy.json
}