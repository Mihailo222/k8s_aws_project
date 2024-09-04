resource "helm_release" "nextcloud" {

    name = "${var.helm_release}" 
    repository = "${var.helm_repository}"
    chart = "${var.chart}"
    version = "${var.version_nextcloud}" //git version; releases
    

    values = compact([
    templatefile("values.tftpl", {
       nextcloud_admin_username = var.nextcloud_username,
       nextcloud_admin_password = var.nextcloud_password,
       s3_enabled = true,
       bucket_name = var.bucket_name,
       external_db_active = true,
       existing_db_creds_secret = true,
       db_secret_name = var.db_secret_name,
       hostKey = var.hostKey,
       usernameKey = var.usernameKey,
       passwordKey = var.passwdKey,
       databaseKey = var.databaseKey,
       hostValue = var.hostValue,
       usernameValue = var.usernameValue,
       passwordValue = var.passwdValue,
       databaseValue = var.dbValue,
       redisEnabled = true,
       redisStorageClass = var.redis_storage_class,
       masterRedisSet = true,
       slaveRedisSet = true
    })
  ])

}
