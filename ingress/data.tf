data "aws_ssm_parameter" "kms" {
  name = format("/eks-cluster/kms")
}

data "aws_ssm_parameter" "kms_arn" {
  name = format("/eks-cluster/kms_arn")
}

data "aws_ssm_parameter" "vpc" {
  name = format("/eks-cluster/vpc/vpc_id")
}

data "aws_ssm_parameter" "private_subnet_1" {
  name = format("/eks-cluster/vpc/subnet_private_1")
}

data "aws_ssm_parameter" "private_subnet_2" {
  name = format("/eks-cluster/vpc/subnet_private_2")
}

data "aws_ssm_parameter" "private_subnet_3" {
  name = format("/eks-cluster/vpc/subnet_private_3")
}

data "aws_ssm_parameter" "public_subnet_1" {
  name = format("/eks-cluster/vpc/subnet_public_1")
}

data "aws_ssm_parameter" "public_subnet_2" {
  name = format("/eks-cluster/vpc/subnet_public_2")
}

data "aws_ssm_parameter" "public_subnet_3" {
  name = format("/eks-cluster/vpc/subnet_public_3")
}