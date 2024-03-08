resource "aws_ssm_parameter" "target_group_shard_001" {
  name  = format("/%s/targetgroup/shard-001", var.name)
  type  = "String"
  value = aws_lb_target_group.shard_01.arn
}

resource "aws_ssm_parameter" "target_group_shard_002" {
  name  = format("/%s/targetgroup/shard-002", var.name)
  type  = "String"
  value = aws_lb_target_group.shard_02.arn
}