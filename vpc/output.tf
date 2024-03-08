output "ssm_kms" {
  value = aws_ssm_parameter.kms.id
}

output "ssm_kms_arn" {
  value = aws_ssm_parameter.kms_arn.id
}

output "ssm_vpc_id" {
  value = aws_ssm_parameter.vpc.id
}

output "ssm_public_subnet_1" {
  value = aws_ssm_parameter.subnet_public_1.id
}

output "ssm_public_subnet_2" {
  value = aws_ssm_parameter.subnet_public_2.id
}

output "ssm_public_subnet_3" {
  value = aws_ssm_parameter.subnet_public_3.id
}

output "ssm_private_subnet_1" {
  value = aws_ssm_parameter.subnet_private_1.id
}

output "ssm_private_subnet_2" {
  value = aws_ssm_parameter.subnet_private_2.id
}

output "ssm_private_subnet_3" {
  value = aws_ssm_parameter.subnet_private_3.id
}