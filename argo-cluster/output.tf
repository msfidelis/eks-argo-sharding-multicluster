output "argocd_url" {
  value = aws_lb.argo.dns_name
}

output "argo_iam" {
  value = aws_iam_role.argocd.arn
}

output "argo_deployer_iam" {
  value = aws_iam_role.argo_deployer.arn
}