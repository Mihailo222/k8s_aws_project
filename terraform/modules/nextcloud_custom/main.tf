resource "helm_release" "nextcloud" {
  name       = "${var.helm_release}"
  chart      = "${var.path_to_the_chart}"
  repository = ""
  version    = "${var.chart_version}"
}