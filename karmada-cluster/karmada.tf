resource "local_file" "kubeconfig_teste" {

  count = length(var.clusters_configs)
  content = templatefile(
    "${path.module}/templates/kubeconfig.tpl", {
      cluster_arn      = data.aws_eks_cluster.members[count.index].arn,
      cluster_name     = data.aws_eks_cluster.members[count.index].id,
      cluster_endpoint = data.aws_eks_cluster.members[count.index].endpoint,
      cluster_ca       = data.aws_eks_cluster.members[count.index].certificate_authority.0.data,
      cluster_region   = data.aws_region.current.name
    }
  )
  filename = "${path.module}/foo.${count.index}.txt"
}

resource "kubectl_manifest" "member_secret" {

  count = length(var.clusters_configs)

  yaml_body = <<YAML
apiVersion: v1
kind: Secret
metadata:
 name: ${lookup(var.clusters_configs[count.index], "identifier")}-kubeconfig
 namespace: karmada-system
type: Opaque
data:
 kubeconfig: ${base64encode(templatefile(
  "${path.module}/templates/kubeconfig.tpl", {
    cluster_arn      = data.aws_eks_cluster.members[count.index].arn,
    cluster_name     = data.aws_eks_cluster.members[count.index].id,
    cluster_endpoint = data.aws_eks_cluster.members[count.index].endpoint,
    cluster_ca       = data.aws_eks_cluster.members[count.index].certificate_authority.0.data,
    cluster_region   = data.aws_region.current.name
}))
}
YAML


depends_on = [
  kubernetes_config_map.aws-auth,
]

}
