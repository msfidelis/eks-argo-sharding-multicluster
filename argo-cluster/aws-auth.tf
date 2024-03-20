resource "kubernetes_config_map" "aws-auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = <<YAML
- rolearn: ${aws_iam_role.eks_nodes_roles.arn}
  username: system:node:{{EC2PrivateDNSName}}
  groups:
  - system:bootstrappers
  - system:nodes
  - system:node-proxier
- rolearn: ${aws_iam_role.eks_cluster_role.arn}
  username: system:node:{{SessionName}}
  groups:
  - system:bootstrappers
  - system:nodes
  - system:node-proxier
- rolearn: arn:aws:iam::${data.aws_caller_identity.current.id}:role/argo-cluster-argocd
  username: argocd
  groups:
  - system:masters
YAML
  }

  depends_on = [
    aws_eks_cluster.main
  ]
}
