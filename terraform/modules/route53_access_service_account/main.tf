resource "kubernetes_service_account" "myfutuerroute53serviceaccount" {
  metadata {
    name      = "${var.service_account_name}"
    namespace = "${var.service_account_namespace}"
    
    annotations = {
      "eks.amazonaws.com/role-arn" = "arn:aws:iam::${var.r53_access_role_name}:role/${var.user_id}"
    }
  }
}