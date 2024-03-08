resource "aws_kms_key" "eks" {
  description = var.project_name
}

resource "aws_kms_alias" "eks" {
  name          = format("alias/%s", var.project_name)
  target_key_id = aws_kms_key.eks.key_id
}