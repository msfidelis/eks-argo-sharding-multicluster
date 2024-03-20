resource "helm_release" "istio_base" {
  name             = "istio-base"
  chart            = "base"
  repository       = "https://istio-release.storage.googleapis.com/charts"
  namespace        = "istio-system"
  create_namespace = true

  version = "1.20.2"

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.cluster,
    kubernetes_config_map.aws-auth,
    helm_release.alb_ingress_controller
  ]
}


resource "helm_release" "istiod" {
  name             = "istio"
  chart            = "istiod"
  repository       = "https://istio-release.storage.googleapis.com/charts"
  namespace        = "istio-system"
  create_namespace = true

  version = "1.20.2"

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.cluster,
    kubernetes_config_map.aws-auth,
    helm_release.istio_base
  ]
}

resource "helm_release" "istio_ingress" {
  name             = "istio-ingressgateway"
  chart            = "gateway"
  repository       = "https://istio-release.storage.googleapis.com/charts"
  namespace        = "istio-system"
  create_namespace = true

  version = "1.20.2"

  set {
    name  = "service.type"
    value = "NodePort"
  }

  set {
    name  = "autoscaling.minReplicas"
    value = var.istio_ingress_min_pods
  }

  set {
    name  = "autoscaling.maxReplicas"
    value = var.istio_ingress_max_pods
  }

  set {
    name  = "service.ports[0].name"
    value = "status-port"
  }

  set {
    name  = "service.ports[0].port"
    value = 15021
  }

  set {
    name  = "service.ports[0].targetPort"
    value = 15021
  }

  set {
    name  = "service.ports[0].nodePort"
    value = 30021
  }

  set {
    name  = "service.ports[0].protocol"
    value = "TCP"
  }


  set {
    name  = "service.ports[1].name"
    value = "http2"
  }

  set {
    name  = "service.ports[1].port"
    value = 80
  }

  set {
    name  = "service.ports[1].targetPort"
    value = 80
  }

  set {
    name  = "service.ports[1].nodePort"
    value = 30080
  }

  set {
    name  = "service.ports[1].protocol"
    value = "TCP"
  }


  set {
    name  = "service.ports[2].name"
    value = "https"
  }

  set {
    name  = "service.ports[2].port"
    value = 443
  }

  set {
    name  = "service.ports[2].targetPort"
    value = 443
  }

  set {
    name  = "service.ports[2].nodePort"
    value = 30443
  }

  set {
    name  = "service.ports[2].protocol"
    value = "TCP"
  }

  depends_on = [
    aws_eks_cluster.main,
    aws_eks_node_group.cluster,
    kubernetes_config_map.aws-auth,
    helm_release.istio_base,
    helm_release.istiod
  ]
}


resource "kubectl_manifest" "istio_target_group_binding_http" {
  yaml_body = <<YAML
apiVersion: elbv2.k8s.aws/v1beta1
kind: TargetGroupBinding
metadata:
  name: istio-ingress
  namespace: istio-system
spec:
  serviceRef:
    name: istio-ingressgateway
    port: http2
  targetGroupARN: ${data.aws_ssm_parameter.target_group.value}
YAML


  depends_on = [
    kubernetes_config_map.aws-auth,
    helm_release.istio_base,
    helm_release.istiod
  ]

}
