resource "aws_ebs_volume" "ebs_vol" {
  availability_zone = "${var.az}"
  size = "${var.ebs_size}"
}