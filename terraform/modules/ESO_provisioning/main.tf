resource "helm_release" "external_secrets" {
  name       = "${var.helm_release_name}"
  repository = "${var.helm_repo_name}"
  chart      = "${var.helm_release_chart}"
}
//helm install external-secrets external-secrets/external-secrets


