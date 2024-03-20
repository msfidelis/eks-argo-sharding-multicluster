resource "helm_release" "kube_state_metrics" {
  name             = "kube-state-metrics"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-state-metrics"
  namespace        = "kube-system"
  create_namespace = true

  set {
    name  = "apiService.create"
    value = "true"
  }

  set {
    name  = "metricLabelsAllowlist[0]"
    value = "nodes=[*]"
  }

  set {
    name  = "metricAnnotationsAllowList[0]"
    value = "nodes=[*]"
  }

  depends_on = [
    aws_eks_cluster.main,
    kubernetes_config_map.aws-auth,
    aws_eks_node_group.cluster,
  ]
}