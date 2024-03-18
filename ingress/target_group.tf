resource "aws_lb_target_group" "shard_01" {
  name     = format("%s-shard-01", var.name)
  port     = 30080
  protocol = "HTTP"
  vpc_id   = data.aws_ssm_parameter.vpc.value
  health_check {
    path    = "/"
    matcher = "200-404"
  }
}

resource "aws_lb_target_group" "shard_02" {
  name     = format("%s-shard-02", var.name)
  port     = 30080
  protocol = "HTTP"
  vpc_id   = data.aws_ssm_parameter.vpc.value
  health_check {
    path    = "/"
    matcher = "200-404"
  }
}