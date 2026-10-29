# alb.tf

# Use the default ALB that is pre-provisioned as part of the account creation
# This ALB has all traffic on *.LICENSE-PLATE-ENV.nimbus.cloud.gob.bc.ca routed to it
data "aws_alb" "main" {
  name = var.alb_name
}

# Redirect all traffic from the ALB to the target group
data "aws_alb_listener" "front_end" {
  load_balancer_arn = data.aws_alb.main.id
  port              = 443
}

resource "aws_alb_target_group" "app" {
  name                 = "${var.application}-${var.target_env}-target-group"
  port                 = var.app_port
  protocol             = "HTTP"
  vpc_id               = data.aws_vpc.main.id
  target_type          = "ip"
  deregistration_delay = 30
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [name]
  }
  stickiness {
    type = "lb_cookie"

  }

  health_check {
    healthy_threshold   = "2"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = var.health_check_matcher
    timeout             = "5"
    path                = "/${local.cmdbuild_webapp}/"
    unhealthy_threshold = "2"
  }

  tags = local.common_tags
}

resource "aws_lb_listener_rule" "host_based_weighted_routing" {
  listener_arn = data.aws_alb_listener.front_end.arn
  priority     = var.app_forward_priority
  lifecycle {
    create_before_destroy = true
  }
  action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.app.arn
  }

  condition {
    host_header {
      values = ["${var.alb_origin_id}"]
    }
  }
}

# Send the bare domain to CMDBuild, so users don't land on Tomcat's ROOT page.
# Must be checked before the forward rule above, so its priority has to be lower.
resource "aws_lb_listener_rule" "root_redirect" {
  listener_arn = data.aws_alb_listener.front_end.arn
  priority     = var.root_redirect_priority
  tags         = merge(local.common_tags, { Name = "${var.application}-${var.target_env}-root-redirect" })

  action {
    type = "redirect"
    redirect {
      status_code = "HTTP_302"
      protocol    = "HTTPS"
      host        = var.application_url
      port        = "443"
      path        = "/${local.cmdbuild_webapp}/"
      query       = "#{query}"
    }
  }

  condition {
    host_header {
      values = ["${var.alb_origin_id}"]
    }
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}


resource "aws_lb_target_group_attachment" "tg_attachment_cmdb" {
  target_group_arn = aws_alb_target_group.app.arn
  target_id        = aws_instance.cmdb.private_ip
  port             = var.app_port

  depends_on = [aws_instance.cmdb]
}