resource "alicloud_kms_key" "this" {
  count                  = length(var.kms_key)
  description            = lookup(var.kms_key[count.index], "description")
  key_usage              = lookup(var.kms_key[count.index], "key_usage")
  automatic_rotation     = lookup(var.kms_key[count.index], "automatic_rotation")
  key_spec               = lookup(var.kms_key[count.index], "key_spec")
  status                 = lookup(var.kms_key[count.index], "status")
  origin                 = lookup(var.kms_key[count.index], "origin")
  pending_window_in_days = lookup(var.kms_key[count.index], "pending_window_in_days")
  protection_level       = lookup(var.kms_key[count.index], "protection_level")
  rotation_interval      = lookup(var.kms_key[count.index], "rotation_interval")
  tags = merge(
    var.tags,
    lookup(var.kms_key[count.index], "tags"),
    {
      deploy = "terraform"
    }
  )
}