resource "alicloud_security_group" "this" {
  count               = length(var.security_group)
  name                = lookup(var.security_group[count.index], "name")
  description         = lookup(var.security_group[count.index], "description")
  vpc_id              = var.vpcs ? data.alicloud_vpcs.this.id : element(alicloud_vpc.this.*.id, lookup(var.security_group[count.index], "vpc_id"))
  resource_group_id   = var.resource_groups ? data.alicloud_resource_manager_resource_groups.this.0.id : element(alicloud_resource_manager_resource_group.this.*.id, lookup(var.security_group[count.index], "resource_group_id"))
  security_group_type = lookup(var.security_group[count.index], "security_group_type")
  inner_access_policy = lookup(var.security_group[count.index], "inner_access_policy")
  tags = merge(
    var.tags,
    lookup(var.vswitch[count.index], "tags"),
    {
      deploy = "terraform"
    }
  )
}