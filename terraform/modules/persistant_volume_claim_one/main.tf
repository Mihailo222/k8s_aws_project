resource "kubernetes_persistent_volume" "pv1" {
    metadata {
      name = "${var.name}"
    }

    spec {
      access_modes = [ "${var.access_mode}" ]
      capacity = {
        storage = "${var.storage}"
      }
      persistent_volume_source {
        csi {
            driver = "${var.driver}"
            volume_handle = "${var.volume_handle}" 
        }
      }

      storage_class_name = "${var.storage_class_name}"
      persistent_volume_reclaim_policy = "${var.persistent_volume_reclaim_policy}"
    }
  
}


