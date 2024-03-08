resource "aws_eks_cluster" "main" {

  name     = var.cluster_name
  version  = var.k8s_version
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {

    subnet_ids = [
      data.aws_ssm_parameter.private_subnet_1.value,
      data.aws_ssm_parameter.private_subnet_2.value,
      data.aws_ssm_parameter.private_subnet_3.value
    ]

  }

  encryption_config {
    provider {
      key_arn = data.aws_ssm_parameter.kms.value
    }
    resources = ["secrets"]
  }

  enabled_cluster_log_types = [
    "api", "audit", "authenticator", "controllerManager", "scheduler"
  ]

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}"     = "shared"
    "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned",
    "k8s.io/cluster-autoscaler/enabled"             = true
  }

}