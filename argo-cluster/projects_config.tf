resource "kubectl_manifest" "argo_projects" {

  yaml_body = <<YAML
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: ${var.argo_project_name}
  namespace: default
spec:
  clusterResourceWhitelist:
  - group: '*'
    kind: '*'
  destinations:
  - namespace: '*'
    server: '*'
  sourceRepos:
  - '*'
YAML

  depends_on = [
    helm_release.argocd
  ]

}