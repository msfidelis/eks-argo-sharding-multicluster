data "aws_iam_policy_document" "argocd_assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    principals {
      identifiers = [aws_iam_openid_connect_provider.eks.arn]
      type        = "Federated"
    }
  }

  #   statement {
  #     actions = ["sts:AssumeRole"]
  #     effect  = "Allow"
  #     principals {
  #       identifiers = [
  #         format("arn:aws:iam::%s:role/%s-argocd", data.aws_caller_identity.current.id, var.cluster_name)
  #       ]
  #       type = "AWS"
  #     }
  #   }

}

resource "aws_iam_role" "argocd" {
  assume_role_policy = data.aws_iam_policy_document.argocd_assume_role.json
  name               = format("%s-argocd", var.cluster_name)
}

data "aws_iam_policy_document" "argocd_policy" {
  version = "2012-10-17"

  statement {

    effect = "Allow"
    actions = [
      "sts:AssumeRole"
    ]

    resources = [
      "*"
    ]

  }

}

resource "aws_iam_policy" "argocd_policy" {
  name        = format("%s-argocd-policy", var.cluster_name)
  path        = "/"
  description = var.cluster_name

  policy = data.aws_iam_policy_document.argocd_policy.json
}

resource "aws_iam_policy_attachment" "argocd_policy" {
  name = "argocd_policy"

  roles = [aws_iam_role.argocd.name]

  policy_arn = aws_iam_policy.argocd_policy.arn
}