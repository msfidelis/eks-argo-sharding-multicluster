data "aws_eks_cluster_auth" "default" {
  name = aws_eks_cluster.main.id
}

data "aws_caller_identity" "current" {}

data "aws_ssm_parameter" "eks" {
  name = format("/aws/service/eks/optimized-ami/%s/amazon-linux-2/recommended/image_id", var.k8s_version)
}

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

######## TARGET GROUP SHARD ########

data "aws_ssm_parameter" "target_group" {
  name = "/product-ingress/targetgroup/shard-002"
}