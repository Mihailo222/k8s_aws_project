output "nextcloud_release_name" {
  description = "Name of future nextcloud service exposed."
  value = helm_release.nextcloud.name
}