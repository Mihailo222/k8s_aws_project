resource "kubernetes_secret" "awssm_secret" {
  
  metadata {
    name = "${var.secrets_name}"
  }
  
  data = {
    "${var.access_key_key}" = "${var.user_access_key}"
     "${var.secret_access_key_key}" = "${var.user_secret_access_key}"
  }

}