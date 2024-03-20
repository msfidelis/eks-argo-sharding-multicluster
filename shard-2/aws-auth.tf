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
- rolearn: arn:aws:iam::${data.aws_caller_identity.current.id}:role/argo-cluster-argocd-deployer
  username: arn:aws:iam::${data.aws_caller_identity.current.id}:role/argo-cluster-argocd-deployer
  groups:
  - system:masters  
YAML
  }

  depends_on = [
    aws_eks_cluster.main
  ]
}