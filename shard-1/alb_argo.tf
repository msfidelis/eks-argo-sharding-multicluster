resource "aws_lb" "argo" {
  name               = format("%s-rollouts", var.cluster_name)
  internal           = var.argo_rollouts_ingress_internal
  load_balancer_type = var.argo_rollouts_ingress_type

  subnets = [
    data.aws_ssm_parameter.public_subnet_1.value,
    data.aws_ssm_parameter.public_subnet_2.value,
    data.aws_ssm_parameter.public_subnet_3.value
  ]
  security_groups = [
    aws_security_group.argo.id
  ]
  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = false

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}

resource "aws_security_group" "argo" {
  name   = format("%s-rollouts", var.cluster_name)
  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group_rule" "argo_80" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 80
  to_port     = 80
  description = "argo-rollouts"
  protocol    = "tcp"

  security_group_id = aws_security_group.argo.id
  type              = "ingress"
}


resource "aws_lb_target_group" "argo" {
  name     = format("%s-argo", var.cluster_name)
  port     = 30080
  protocol = "HTTP"
  vpc_id   = data.aws_ssm_parameter.vpc.value
  health_check {
    path = "/rollouts/"
  }
}


resource "aws_lb_listener" "argo" {
  load_balancer_arn = aws_lb.argo.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.argo.arn
  }
}


resource "kubectl_manifest" "argo" {
  yaml_body = <<YAML
apiVersion: elbv2.k8s.aws/v1beta1
kind: TargetGroupBinding
metadata:
  name: argo-rollouts
  namespace: argo-rollouts
spec:
  serviceRef:
    name: argo-rollouts-dashboard
    port: 3100
  targetGroupARN: ${aws_lb_target_group.argo.arn}
YAML

  depends_on = [
    helm_release.argo_rollouts
  ]

}
