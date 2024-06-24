resource "alicloud_resource_manager_resource_group" "this" {
  count               = length(var.resource_group)
  display_name        = lookup(var.resource_group[count.index], "display_name")
  resource_group_name = lookup(var.resource_group[count.index], "resource_group_name")
}