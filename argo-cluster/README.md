<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.0 |
| <a name="requirement_kubectl"></a> [kubectl](#requirement\_kubectl) | ~> 1.14 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.41.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.12.1 |
| <a name="provider_kubectl"></a> [kubectl](#provider\_kubectl) | 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.27.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_addon.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.coredns](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_addon.kubeproxy](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_addon) | resource |
| [aws_eks_cluster.main](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_instance_profile.nodes](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.argocd_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy_attachment.argocd_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_policy_attachment.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_policy_attachment) | resource |
| [aws_iam_role.alb_controller](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.argo_deployer](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.argocd](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_nodes_roles](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cloudwatch_cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cni](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cni_cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ecr_Cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-cluster-service](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.node_cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.ssm_cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lb.argo](https://registry.terraform.io/providers/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.argo](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.argo](https://registry.terraform.io/providers/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.argo](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.argo_80](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.etc_tcp](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeport_cluster](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.nodeport_cluster_udp](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.port_2379](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.port_443](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.port_5443](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.port_80](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.port_8080](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.port_8443](https://registry.terraform.io/providers/aws/latest/docs/resources/security_group_rule) | resource |
| [helm_release.alb_ingress_controller](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.argocd](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [helm_release.kube_state_metrics](https://registry.terraform.io/providers/helm/latest/docs/resources/release) | resource |
| [kubectl_manifest.argo](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.argo_clusters](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubectl_manifest.gp3_storageclass](https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs/resources/manifest) | resource |
| [kubernetes_config_map.aws-auth](https://registry.terraform.io/providers/kubernetes/latest/docs/resources/config_map) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_eks_cluster.members](https://registry.terraform.io/providers/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy_document.argocd_assume_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.argocd_deployer_assume_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.argocd_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_load_balancer_controller_assume_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.aws_load_balancer_controller_policy](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.csi_driver](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_cluster_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.eks_nodes_role](https://registry.terraform.io/providers/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/aws/latest/docs/data-sources/region) | data source |
| [aws_ssm_parameter.eks](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.kms](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.kms_arn](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.private_subnet_1](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.private_subnet_2](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.private_subnet_3](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.public_subnet_1](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.public_subnet_2](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.public_subnet_3](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.vpc](https://registry.terraform.io/providers/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [tls_certificate.eks](https://registry.terraform.io/providers/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_cni_version"></a> [addon\_cni\_version](#input\_addon\_cni\_version) | Specifies the version of the AWS VPC CNI (Container Network Interface) plugin to use, which manages the network interfaces for pod networking. | `string` | `"v1.14.1-eksbuild.1"` | no |
| <a name="input_addon_coredns_version"></a> [addon\_coredns\_version](#input\_addon\_coredns\_version) | Defines the version of CoreDNS to use, a DNS server/forwarder that is integral to internal Kubernetes DNS resolution. | `string` | `"v1.11.1-eksbuild.4"` | no |
| <a name="input_addon_csi_version"></a> [addon\_csi\_version](#input\_addon\_csi\_version) | Indicates the version of the Container Storage Interface (CSI) driver to use for managing storage volumes in Kubernetes. | `string` | `"v1.26.1-eksbuild.1"` | no |
| <a name="input_addon_kubeproxy_version"></a> [addon\_kubeproxy\_version](#input\_addon\_kubeproxy\_version) | Sets the version of Kubeproxy to be used, which handles Kubernetes network services like forwarding the requests to correct containers. | `string` | `"v1.29.0-eksbuild.1"` | no |
| <a name="input_argo_cd_ingress_internal"></a> [argo\_cd\_ingress\_internal](#input\_argo\_cd\_ingress\_internal) | Indicates whether the Network Load Balancer (NLB) for the EKS cluster should be internal, restricting access to within the AWS network. | `bool` | `false` | no |
| <a name="input_argo_cd_ingress_type"></a> [argo\_cd\_ingress\_type](#input\_argo\_cd\_ingress\_type) | n/a | `string` | `"application"` | no |
| <a name="input_argo_cd_virtual_service_host"></a> [argo\_cd\_virtual\_service\_host](#input\_argo\_cd\_virtual\_service\_host) | The hostname for the Argo cd virtual service, used for advanced deployment capabilities like canary and blue-green deployments in Kubernetes. | `string` | `"argo-cd.k8s.raj.ninja"` | no |
| <a name="input_auto_scale_options"></a> [auto\_scale\_options](#input\_auto\_scale\_options) | Configuration for the EKS cluster auto-scaling. It includes the minimum (min), maximum (max), and desired (desired) number of worker nodes. | `map` | <pre>{<br>  "desired": 3,<br>  "max": 10,<br>  "min": 3<br>}</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region where the EKS cluster will be deployed. This should be set to the region where you want your Kubernetes resources to reside. | `string` | `"us-east-1"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the Amazon EKS cluster. This is a unique identifier for your EKS cluster within the AWS region. | `string` | `"argo-cluster"` | no |
| <a name="input_clusters_configs"></a> [clusters\_configs](#input\_clusters\_configs) | n/a | `list` | <pre>[<br>  {<br>    "cluster_name": "eks-shard-1",<br>    "identifier": "cluster-01"<br>  }<br>]</pre> | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | A map of default tags to apply to all resources. These tags can help with identifying and organizing resources within the AWS environment. | `map(string)` | <pre>{<br>  "Environment": "prod",<br>  "Foo": "Bar",<br>  "Ping": "Pong"<br>}</pre> | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | The version of Kubernetes to use for the EKS cluster. This version should be compatible with the AWS EKS service and other infrastructure components. | `string` | `"1.29"` | no |
| <a name="input_nodes_instances_sizes"></a> [nodes\_instances\_sizes](#input\_nodes\_instances\_sizes) | A list of EC2 instance types to use for the EKS worker nodes. These instance types should balance between cost, performance, and resource requirements for your workload. | `list` | <pre>[<br>  "t3.large"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_argo_deployer_iam"></a> [argo\_deployer\_iam](#output\_argo\_deployer\_iam) | n/a |
| <a name="output_argo_iam"></a> [argo\_iam](#output\_argo\_iam) | n/a |
| <a name="output_argocd_url"></a> [argocd\_url](#output\_argocd\_url) | n/a |
<!-- END_TF_DOCS -->