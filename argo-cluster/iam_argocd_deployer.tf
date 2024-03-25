data "aws_iam_policy_document" "argocd_deployer_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      identifiers = [
        aws_iam_role.argocd.arn
      ]
      type = "AWS"
    }
  }
}

resource "aws_iam_role" "argo_deployer" {
  assume_role_policy = data.aws_iam_policy_document.argocd_deployer_assume_role.json
  name               = format("%s-argocd-deployer", var.cluster_name)
}
