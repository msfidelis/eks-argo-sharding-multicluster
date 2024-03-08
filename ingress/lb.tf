resource "aws_lb" "main" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.ingress_type

  subnets = [
    data.aws_ssm_parameter.public_subnet_1.value,
    data.aws_ssm_parameter.public_subnet_2.value,
    data.aws_ssm_parameter.public_subnet_3.value
  ]
  security_groups = [
    aws_security_group.main.id
  ]
  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = false
}