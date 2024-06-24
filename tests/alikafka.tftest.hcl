run "setup_tests" {
  module {
    source = "./tests/setup"
  }
}

run "Create_Alikafaka_Resource" {
  command = [init,plan,apply]

  variables {
    available_resource_creation = "VSwitch"
    vpc = [
      {
        id          = 0
        vpc_name    = "alikafka-vpc"
        cidr_block  = "172.16.0.0/12"
      }
    ]
    vswitch = [
      {
        id          = 0
        vpc_id      = 0
        cidr_block  = "172.16.0.0/24"
      }
    ]
    security_group = [
      {
        id      = 0
        vpc_id  = 0
      }
    ]
    alifkafka_instance = [
      {
        id                = 0
        name              = "alikafka_instance_1"
        partition_num     = "50"
        disk_type         = "1"
        disk_size         = "500"
        deploy_type       = "5"
        io_max            = "20"
        vswitch_id        = 0
        security_group_id = 0
      }
    ]
    consumer_group = [
      {
        id          = 0
        consumer_id = "aki_consumer_1"
        instance_id = 0
      }
    ]
    instance_allowed_ip_attachment = [
      {
        id            = 0
        instance_id   = 0
        allowed_type  = "vpc"
        port_range    = "9092/9092"
        allowed_ip    = "114.237.9.78/32"
      }
    ]
    sasl_user = [
      {
        id          = 0
        instance_id = 0
        username    = "admin"
        password    = "tf_example123"
      }
    ]
    topic = [
      {
        id = 0
        instance_id   = 0
        topic         = "example-topic"
        local_topic   = "false"
        compact_topic = "false"
        partition_num = "12"
        remark        = "dafault_kafka_topic_remark"
      }
    ]
    sasl_acl = [
      {
        id                        = 0
        instance_id               = 0
        sasl_user_id              = 0
        acl_resource_type         = "Topic"
        topic_id                  = 0
        acl_resource_pattern_type = "LITERAL"
        acl_operation_type        = "Write"
      }
    ]
  }
}