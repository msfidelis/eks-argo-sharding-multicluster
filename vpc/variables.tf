#########################
###  GENERAL CONFIGS  ###
#########################

variable "project_name" {
  description = "The name of the Amazon EKS cluster. This is a unique identifier for your EKS cluster within the AWS region."
  default     = "eks-cluster"
}

variable "aws_region" {
  description = "AWS region where the EKS cluster will be deployed. This should be set to the region where you want your Kubernetes resources to reside."
  default     = "us-east-1"
}


#########################
###  INGRESS CONFIGS  ###
#########################

variable "nlb_ingress_internal" {
  type        = bool
  description = "Indicates whether the Network Load Balancer (NLB) for the EKS cluster should be internal, restricting access to within the AWS network."
  default     = false
}

variable "nlb_ingress_type" {
  type        = string
  description = "Specifies the type of ingress to be used, such as 'network', determining how the NLB handles incoming traffic to the EKS cluster."
  default     = "network"
}

variable "proxy_protocol_v2" {
  type        = bool
  description = "Enables or disables Proxy Protocol v2 on the Network Load Balancer, used for preserving client IP addresses and other connection information."
  default     = false
}

variable "nlb_ingress_enable_termination_protection" {
  type        = bool
  description = "Determines if termination protection is enabled for the Network Load Balancer, preventing accidental deletion."
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  type        = bool
  description = "Controls whether cross-zone load balancing is enabled for the Network Load Balancer, allowing even traffic distribution across all zones."
  default     = false
}


#########################
###  ROUTE53 CONFIGS  ###
#########################

variable "cluster_private_zone" {
  type        = string
  description = "The private DNS zone name for the EKS cluster in AWS Route53. This zone is used for internal DNS resolution within the cluster."
  default     = "k8s.cluster"
}