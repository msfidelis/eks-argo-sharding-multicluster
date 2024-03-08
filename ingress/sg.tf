resource "aws_security_group" "main" {
  name   = format("%s", var.name)
  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_security_group_rule" "ingress_80" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 80
  to_port     = 80
  description = "ingress"
  protocol    = "tcp"

  security_group_id = aws_security_group.main.id
  type              = "ingress"
}


resource "aws_security_group_rule" "ingress_443" {
  cidr_blocks = ["0.0.0.0/0"]
  from_port   = 443
  to_port     = 443
  description = "ingress"
  protocol    = "tcp"

  security_group_id = aws_security_group.main.id
  type              = "ingress"
}
