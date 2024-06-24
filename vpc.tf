resource "alicloud_vpc" "this" {
  count                = length(var.vpc)
  vpc_name             = lookup(var.vpc[count.index], "vpc_name")
  cidr_block           = lookup(var.vpc[count.index], "cidr_block")
  classic_link_enabled = lookup(var.vpc[count.index], "classic_link_enabled")
  description          = lookup(var.vpc[count.index], "description")
  dry_run              = lookup(var.vpc[count.index], "dry_run")
  enable_ipv6          = lookup(var.vpc[count.index], "enable_ipv6")
  ipv6_isp             = lookup(var.vpc[count.index], "ipv6_isp")
  resource_group_id    = lookup(var.vpc[count.index], "resource_group_id")
  tags = merge(
    var.tags,
    lookup(var.vpc[count.index], "tags"),
    {
      deploy = "terraform"
    }
  )
  user_cidrs = lookup(var.vpc[count.index], "user_cidrs")
}

resource "alicloud_vswitch" "this" {
  count                = length(var.vswitch)
  vswitch_name         = lookup(var.vswitch[count.index], "vswitch_name")
  cidr_block           = lookup(var.vswitch[count.index], "cidr_block")
  vpc_id               = var.vpcs ? data.alicloud_vpcs.this.id : element(alicloud_vpc.this.*.id, lookup(var.vswitch[count.index], "vpc_id"))
  description          = lookup(var.vswitch[count.index], "description")
  zone_id              = data.alicloud_zones.this.id
  enable_ipv6          = lookup(var.vswitch[count.index], "enable_ipv6")
  ipv6_cidr_block_mask = lookup(var.vswitch[count.index], "ipv6_cidr_block_mask")
  tags = merge(
    var.tags,
    lookup(var.vswitch[count.index], "tags"),
    {
      deploy = "terraform"
    }
  )
}