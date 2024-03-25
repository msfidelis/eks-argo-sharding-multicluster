resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.shard_01.arn
        weight = lookup(var.shard_weight, "shard_01")
      }
      target_group {
        arn    = aws_lb_target_group.shard_02.arn
        weight = lookup(var.shard_weight, "shard_02")
      }
    }
  }
}
