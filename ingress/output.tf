output "ingress" {
  value = aws_lb.main.dns_name
}

output "ssm_target_group_shard_01" {
  value = aws_ssm_parameter.target_group_shard_001.name
}

output "ssm_target_group_shard_02" {
  value = aws_ssm_parameter.target_group_shard_002.name
}