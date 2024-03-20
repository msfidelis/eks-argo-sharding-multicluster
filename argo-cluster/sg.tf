# resource "aws_security_group_rule" "self_tcp" {
#   from_port = 0
#   to_port   = 0
#   protocol  = "-1"
#   self      = true

#   security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
#   type              = "ingress"
# }

resource "aws_security_group_rule" "etc_tcp" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 10000
  to_port     = 12768
  description = "nodeport"
  protocol    = "tcp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}

resource "aws_security_group_rule" "nodeport_cluster" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 30000
  to_port     = 32768
  description = "nodeport"
  protocol    = "tcp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}

resource "aws_security_group_rule" "nodeport_cluster_udp" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 30000
  to_port     = 32768
  description = "nodeport"
  protocol    = "udp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}

resource "aws_security_group_rule" "port_8080" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}

resource "aws_security_group_rule" "port_80" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}

resource "aws_security_group_rule" "port_443" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}

resource "aws_security_group_rule" "port_8443" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 8443
  to_port     = 8443
  protocol    = "tcp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}

resource "aws_security_group_rule" "port_5443" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 5443
  to_port     = 5443
  protocol    = "tcp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}

resource "aws_security_group_rule" "port_2379" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 2379
  to_port     = 2379
  protocol    = "tcp"

  security_group_id = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  type              = "ingress"
}