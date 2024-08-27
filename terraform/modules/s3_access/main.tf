// kreiraj bucket 
resource "aws_s3_bucket" "my_s3_bucket" {

  bucket = "${var.bucket_name}"

  acl = "private"
  
  versioning {
    enabled = true
  }
}






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

data "aws_iam_policy_document" "s3_policy" { 
  version = "2012-10-17"

  statement {
    actions   = [
      "s3:ListBucket",
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    effect    = "Allow"
    resources = [
      "arn:aws:s3:::${var.bucket_name}",   
      "arn:aws:s3:::${var.bucket_name}/*"          
    ]
  }
}

resource "aws_iam_role" "s3-role" {
  name               = "${var.access_role4_s3_bucket}"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}


resource "aws_iam_role_policy" "s3_policy_attachment" {
  role       = aws_iam_role.s3-role.id
  policy = data.aws_iam_policy_document.s3_policy.json
}



