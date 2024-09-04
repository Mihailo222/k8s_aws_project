resource "helm_release" "external_secrets" {

  name       = var.helm_release_name  //"external-secrets"
  repository = var.helm_repo_name      //"https://charts.external-secrets.io"
  chart      = var.helm_release_chart   //"external-secrets"

}
//helm install external-secrets external-secrets/external-secrets


