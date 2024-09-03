resource "aws_iam_policy" "ec2_access" {
  name        = "EC2EBSVolumesAccessPolicy"
  description = "Policy that grants access to EC2's EBS volumes."
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "ec2:*",
        Resource = [
        "*"
        ],
      },
    ],
  })
}

resource "aws_iam_role_policy_attachment" "karpenter_ec2_full_access" {
  policy_arn = aws_iam_policy.ec2_access.arn
  role      = "${var.eks_node_group_role}"
}