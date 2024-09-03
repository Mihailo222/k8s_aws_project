resource "kubernetes_ingress" "nginx_ingress" {
  metadata {
    name      = "${var.name}"
    namespace = "${var.namespace}"
  }

  spec {
    ingress_class_name = "${var.ingress_class_name}"

    rule {
      host = "${var.host}"

      http {
        path {
          path     = "${var.path}"
         // path_type = "Prefix"
         

          backend {
              service_name = "${var.service_name}"
              service_port = "${var.service_port}"
          }
        }
      }
    }
  }
}

