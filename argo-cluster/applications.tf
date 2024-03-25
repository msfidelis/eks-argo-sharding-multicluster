resource "kubectl_manifest" "argo_applications" {

    count = length(var.clusters_configs)

  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: ${lookup(var.clusters_configs[count.index], "shard_name")}
  namespace: default
spec:
  project: ${var.argo_project_name}
  source:
    repoURL: '${var.argo_github_repository}'
    targetRevision: HEAD
    path: ${var.argo_github_path}
  destination:
    name: ${lookup(var.clusters_configs[count.index], "cluster_name")}
  syncPolicy:
    automated: {}
YAML

  depends_on = [
    helm_release.argocd,
    kubectl_manifest.argo_clusters,
    kubectl_manifest.argo_projects
  ]

}