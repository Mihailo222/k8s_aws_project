resource "kubernetes_service_account" "futureserviceaccount" {
  metadata {
    name      = "${var.service_account_name}"
    namespace = "${var.service_account_namespace}"
    
    annotations = {
      "eks.amazonaws.com/role-arn" = "arn:aws:iam::${var.user_id}:role/${var.s3_access_role_name}"
    }
  }
}
