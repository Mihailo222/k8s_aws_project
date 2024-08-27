data "aws_iam_policy_document" "assume_role_policy" {  
  version = "2012-10-17"

  statement {
    actions   = ["sts:AssumeRoleWithWebIdentity"]  
    effect    = "Allow"
    principals { 
      type        = "Federated"
      identifiers = ["arn:aws:iam::${var.account_id}:oidc-provider/oidc.eks.${var.region}.amazonaws.com/id/${var.cluster_oidc_id}"] 
    }

    condition {
      test     = "StringEquals"
      variable = "oidc.eks.${var.region}.amazonaws.com/id/${var.cluster_oidc_id}:sub" 
      values  = ["system:serviceaccount:${var.namespace}:${var.service_account_name}"] 
    }
  }
}

data "aws_iam_policy_document" "route53_policy" { 
  version = "2012-10-17"

  statement {
    actions   = [
       
        "route53:ListResourceRecordSets",
        "route53:ListHostedZones",
        "route53:GetHostedZone"

    ]
    effect    = "Allow"
    resources = [
       "arn:aws:route53:::hostedzone/${var.academy_zone_id}"        
    ]
  }
}

resource "aws_iam_role" "route53-role" {
  name               = "${var.iam_role_name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}


resource "aws_iam_role_policy" "route53_policy_attachment" { 
  role       = aws_iam_role.route53-role.id
  policy = data.aws_iam_policy_document.route53_policy.json
}

