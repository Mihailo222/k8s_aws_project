resource "helm_release" "ingress_nginx" {
  name = "${var.name}"
  repository = "${var.repository}"
  chart = "${var.chart}"
  namespace = "${var.namespace}"
  create_namespace = true
}