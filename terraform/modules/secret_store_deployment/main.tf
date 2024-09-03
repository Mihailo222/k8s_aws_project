resource "kubernetes_manifest" "secretstore_sample" {
  manifest = {
    apiVersion = "external-secrets.io/v1beta1"
    kind       = "SecretStore"
    metadata = {
      name = "${var.secret_store_name}"
    }
    spec = {
      provider = {
        aws = {
          service = "SecretsManager"
          region  = "${var.region}"
          auth = {
            secretRef = {
              accessKeyIDSecretRef = {
                name = "${var.aws_auth_secret}"
                key  = "${var.access_key}"
              }
              secretAccessKeySecretRef = {
                name = "${var.aws_auth_secret}"
                key  = "${var.secret_access_key}"
              }
            }
          }
        }
      }
    }
  }
}

