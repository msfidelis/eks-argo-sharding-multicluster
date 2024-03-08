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