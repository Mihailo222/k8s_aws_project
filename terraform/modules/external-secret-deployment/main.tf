resource "kubernetes_manifest" "exampleextsecret" {
  manifest = {
    apiVersion = "external-secrets.io/v1beta1"
    kind       = "ExternalSecret"
    metadata = {
      name = "${var.external_secret_name}"
      namespace = var.external_secret_namespace
    }
    spec = {
      refreshInterval = "10m"
      secretStoreRef = {
        name = "${var.secret_store_name}"
        kind = "SecretStore"
      }
      target = {
        name            = "${var.new-secret}"
        creationPolicy  = "Owner"
      }
      dataFrom = [
        {
          extract = {
            key = "${var.secret_manager_secret_name}"
          }
        }
      ]
    }
  }
}
