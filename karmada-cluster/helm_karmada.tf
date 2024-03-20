# resource "helm_release" "karmada" {
#   name             = "karmada"
#   namespace        = "karmada-system"
#   chart            = "./charts/karmada"
#   create_namespace = true

#   dependency_update = true


#   # set {
#   #   name = "etcd.internal.pvc.storageClass"
#   #   value = "efs-sc"
#   # }  

#   set {
#     name  = "etcd.internal.pvc.storageClass"
#     value = "gp3"
#   }

#   set {
#     name  = "etcd.internal.storageType"
#     value = "pvc"
#   }

#   set {
#     name  = "etcd.internal.pvc.size"
#     value = "8Gi"
#   }

#   depends_on = [
#     kubernetes_config_map.aws-auth,
#     aws_eks_node_group.cluster,
#     # kubectl_manifest.efs_storageclass

#   ]

# }

resource "helm_release" "karmada" {
  name             = "karmada"
  namespace        = "karmada-system"
  chart            = "./charts/karmada"
  create_namespace = true

  dependency_update = true


  # set {
  #   name = "etcd.internal.pvc.storageClass"
  #   value = "efs-sc"
  # }  

  set {
    name  = "etcd.internal.pvc.storageClass"
    value = "gp3"
  }

  set {
    name  = "etcd.internal.storageType"
    value = "pvc"
  }

  set {
    name  = "etcd.internal.pvc.size"
    value = "8Gi"
  }

  depends_on = [
    kubernetes_config_map.aws-auth,
    aws_eks_node_group.cluster,
    # kubectl_manifest.efs_storageclass

  ]

}
