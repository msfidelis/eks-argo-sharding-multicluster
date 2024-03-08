resource "aws_eks_node_group" "cluster" {

  cluster_name    = aws_eks_cluster.main.name
  node_group_name = format("%s", aws_eks_cluster.main.name)
  node_role_arn   = aws_iam_role.eks_nodes_roles.arn

  subnet_ids = [
    data.aws_ssm_parameter.private_subnet_1.value,
    data.aws_ssm_parameter.private_subnet_2.value,
    data.aws_ssm_parameter.private_subnet_3.value
  ]

  instance_types = var.nodes_instances_sizes

  scaling_config {
    desired_size = lookup(var.auto_scale_options, "desired")
    max_size     = lookup(var.auto_scale_options, "max")
    min_size     = lookup(var.auto_scale_options, "min")
  }

  labels = {
    "ingress/ready" = "true"
  }

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}"     = "owned",
    "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned",
    "k8s.io/cluster-autoscaler/enabled"             = true
  }

  lifecycle {
    ignore_changes = [
      scaling_config[0].desired_size
    ]
  }

  depends_on = [
    kubernetes_config_map.aws-auth
  ]

  timeouts {
    create = "60m"
    update = "2h"
    delete = "2h"
  }
}