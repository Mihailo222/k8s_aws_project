resource "helm_release" "nextcloud" {

    name = "${var.helm_release}" //helm release name
    repository = "${var.helm_repository}"
    chart = "${var.chart}"
    version = "${var.version}" //git version; releases
    
    set {
        name = "nextcloud.username"
        value = "${var.nextcloud_name}"
    }

    set {
        name = "nextcloud.password"
        value = "${var.nextcloud_passwd}"
    }
}