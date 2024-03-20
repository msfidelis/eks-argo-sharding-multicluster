resource "kubectl_manifest" "gp3_storageclass" {
  yaml_body = <<YAML
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: gp3
  annotations:
    storageclass.kubernetes.io/is-default-class: "true"
allowVolumeExpansion: true
provisioner: ebs.csi.aws.com
volumeBindingMode: WaitForFirstConsumer
parameters:
  type: gp3
YAML

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.cluster,
    kubernetes_config_map.aws-auth
  ]
}