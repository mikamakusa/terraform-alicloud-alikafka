output "alikafka_instances" {
  value = try(
    alicloud_alikafka_instance.this.*.id,
  )
}

output "topic" {
  value = try(
    alicloud_alikafka_topic.this.*.id
  )
}

output "sasl" {
  value = try(
    alicloud_alikafka_sasl_acl.this.*.id,
    alicloud_alikafka_sasl_user.this.*.id
  )
}

output "allowed_ip_attachment" {
  value = try(
    alicloud_alikafka_instance_allowed_ip_attachment.this.*.id
  )
}