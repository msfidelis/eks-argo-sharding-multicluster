# resource "aws_eks_fargate_profile" "kube_system" {
#   cluster_name           = aws_eks_cluster.main.name
#   fargate_profile_name   = "kube-system"
#   pod_execution_role_arn = aws_iam_role.eks_cluster_role.arn
#   subnet_ids = [
#     data.aws_ssm_parameter.private_subnet_1.value,
#     data.aws_ssm_parameter.private_subnet_2.value,
#     data.aws_ssm_parameter.private_subnet_3.value
#   ]

#   selector {
#     namespace = "kube-system"
#   }
# }

# resource "aws_eks_fargate_profile" "karmada_system" {
#   cluster_name           = aws_eks_cluster.main.name
#   fargate_profile_name   = "karmada-system"
#   pod_execution_role_arn = aws_iam_role.eks_cluster_role.arn
#   subnet_ids = [
#     data.aws_ssm_parameter.private_subnet_1.value,
#     data.aws_ssm_parameter.private_subnet_2.value,
#     data.aws_ssm_parameter.private_subnet_3.value
#   ]

#   selector {
#     namespace = "karmada-system"
#   }
# }