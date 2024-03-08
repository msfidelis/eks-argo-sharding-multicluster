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
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.39.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.vpc_iep](https://registry.terraform.io/providers/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_kms_alias.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.eks](https://registry.terraform.io/providers/aws/latest/docs/resources/kms_key) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.nat_access](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route.public_internet_access](https://registry.terraform.io/providers/aws/latest/docs/resources/route) | resource |
| [aws_route_table.igw_route_table](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.nat](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private1a](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private1b](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private1c](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/route_table_association) | resource |
| [aws_ssm_parameter.kms](https://registry.terraform.io/providers/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.subnet_private_1](https://registry.terraform.io/providers/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.subnet_private_2](https://registry.terraform.io/providers/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.subnet_private_3](https://registry.terraform.io/providers/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.subnet_public_1](https://registry.terraform.io/providers/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.subnet_public_2](https://registry.terraform.io/providers/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.subnet_public_3](https://registry.terraform.io/providers/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.vpc](https://registry.terraform.io/providers/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_subnet.private_subnet_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private_subnet_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1a](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1b](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public_subnet_1c](https://registry.terraform.io/providers/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_ipv4_cidr_block_association.pods](https://registry.terraform.io/providers/aws/latest/docs/resources/vpc_ipv4_cidr_block_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region where the EKS cluster will be deployed. This should be set to the region where you want your Kubernetes resources to reside. | `string` | `"us-east-1"` | no |
| <a name="input_cluster_private_zone"></a> [cluster\_private\_zone](#input\_cluster\_private\_zone) | The private DNS zone name for the EKS cluster in AWS Route53. This zone is used for internal DNS resolution within the cluster. | `string` | `"k8s.cluster"` | no |
| <a name="input_enable_cross_zone_load_balancing"></a> [enable\_cross\_zone\_load\_balancing](#input\_enable\_cross\_zone\_load\_balancing) | Controls whether cross-zone load balancing is enabled for the Network Load Balancer, allowing even traffic distribution across all zones. | `bool` | `false` | no |
| <a name="input_nlb_ingress_enable_termination_protection"></a> [nlb\_ingress\_enable\_termination\_protection](#input\_nlb\_ingress\_enable\_termination\_protection) | Determines if termination protection is enabled for the Network Load Balancer, preventing accidental deletion. | `bool` | `false` | no |
| <a name="input_nlb_ingress_internal"></a> [nlb\_ingress\_internal](#input\_nlb\_ingress\_internal) | Indicates whether the Network Load Balancer (NLB) for the EKS cluster should be internal, restricting access to within the AWS network. | `bool` | `false` | no |
| <a name="input_nlb_ingress_type"></a> [nlb\_ingress\_type](#input\_nlb\_ingress\_type) | Specifies the type of ingress to be used, such as 'network', determining how the NLB handles incoming traffic to the EKS cluster. | `string` | `"network"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the Amazon EKS cluster. This is a unique identifier for your EKS cluster within the AWS region. | `string` | `"eks-cluster"` | no |
| <a name="input_proxy_protocol_v2"></a> [proxy\_protocol\_v2](#input\_proxy\_protocol\_v2) | Enables or disables Proxy Protocol v2 on the Network Load Balancer, used for preserving client IP addresses and other connection information. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssm_kms"></a> [ssm\_kms](#output\_ssm\_kms) | n/a |
| <a name="output_ssm_private_subnet_1"></a> [ssm\_private\_subnet\_1](#output\_ssm\_private\_subnet\_1) | n/a |
| <a name="output_ssm_private_subnet_2"></a> [ssm\_private\_subnet\_2](#output\_ssm\_private\_subnet\_2) | n/a |
| <a name="output_ssm_private_subnet_3"></a> [ssm\_private\_subnet\_3](#output\_ssm\_private\_subnet\_3) | n/a |
| <a name="output_ssm_public_subnet_1"></a> [ssm\_public\_subnet\_1](#output\_ssm\_public\_subnet\_1) | n/a |
| <a name="output_ssm_public_subnet_2"></a> [ssm\_public\_subnet\_2](#output\_ssm\_public\_subnet\_2) | n/a |
| <a name="output_ssm_public_subnet_3"></a> [ssm\_public\_subnet\_3](#output\_ssm\_public\_subnet\_3) | n/a |
| <a name="output_ssm_vpc_id"></a> [ssm\_vpc\_id](#output\_ssm\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->