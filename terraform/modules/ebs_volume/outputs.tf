output "volume_id" {
  description = "Returns an ID of EBS volume."
  value = aws_ebs_volume.ebs_vol.id
}

