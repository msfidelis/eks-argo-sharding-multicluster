resource "aws_ssm_parameter" "vpc" {
  name  = format("/%s/vpc/vpc_id", var.project_name)
  type  = "String"
  value = aws_vpc.main.id
}

resource "aws_ssm_parameter" "subnet_private_1" {
  name  = format("/%s/vpc/subnet_private_1", var.project_name)
  type  = "String"
  value = aws_subnet.private_subnet_1a.id
}

resource "aws_ssm_parameter" "subnet_private_2" {
  name  = format("/%s/vpc/subnet_private_2", var.project_name)
  type  = "String"
  value = aws_subnet.private_subnet_1b.id
}

resource "aws_ssm_parameter" "subnet_private_3" {
  name  = format("/%s/vpc/subnet_private_3", var.project_name)
  type  = "String"
  value = aws_subnet.private_subnet_1c.id
}

resource "aws_ssm_parameter" "subnet_public_1" {
  name  = format("/%s/vpc/subnet_public_1", var.project_name)
  type  = "String"
  value = aws_subnet.public_subnet_1a.id
}

resource "aws_ssm_parameter" "subnet_public_2" {
  name  = format("/%s/vpc/subnet_public_2", var.project_name)
  type  = "String"
  value = aws_subnet.public_subnet_1b.id
}

resource "aws_ssm_parameter" "subnet_public_3" {
  name  = format("/%s/vpc/subnet_public_3", var.project_name)
  type  = "String"
  value = aws_subnet.public_subnet_1c.id
}

resource "aws_ssm_parameter" "kms" {
  name  = format("/%s/kms", var.project_name)
  type  = "String"
  value = aws_kms_key.eks.id
}

resource "aws_ssm_parameter" "kms_arn" {
  name  = format("/%s/kms_arn", var.project_name)
  type  = "String"
  value = aws_kms_key.eks.arn
}