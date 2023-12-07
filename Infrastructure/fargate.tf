resource "aws_ecs_cluster" "cmdb_cluster" {
  name = "${var.application}_cluster"
}

resource "aws_ecs_cluster_capacity_providers" "cmdb_cluster" {
  cluster_name       = aws_ecs_cluster.cmdb_cluster.name
  capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 100

  }
}

resource "aws_ecs_task_definition" "cmdb_td" {
  family                   = "${var.application}-${var.target_env}-task"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory
  tags                     = local.common_tags
  container_definitions = jsonencode([
    {
      essential   = true
      name        = "${var.application}-${var.target_env}-definition"
      image       = "itmicus/cmdbuild:app-3.4.2"
      cpu         = var.fargate_cpu
      memory      = var.fargate_memory
      networkMode = "awsvpc"
      portMappings = [
        {
          protocol      = "tcp"
          containerPort = var.app_port
          hostPort      = var.app_port
        }
      ]
      secrets = [
        { name = "PG_URL",
        valueFrom = "${aws_secretsmanager_secret_version.pg_url.arn}" },
        { name = "PG_USER",
        valueFrom = "${aws_secretsmanager_secret_version.rds_credentials.arn}:username::" },
        { name = "PG_PASSWORD",
        valueFrom = "${aws_secretsmanager_secret_version.rds_credentials.arn}:password::" }
      ]
      environment = [
        { name = "JVM_ARGS",
        value = "-Xms512m -Xmx756m" }
      ]

      logConfiguration = {
        "logDriver" : "awslogs",
        "options" : {
          "awslogs-create-group" = "true"
          "awslogs-group" : "/ecs/${var.application}",
          "awslogs-region" : "${var.aws_region}",
          "awslogs-stream-prefix" : "streaming"
        }
      }
    }
  ])
}

resource "aws_ecs_service" "main" {
  name            = "${var.application}-${var.target_env}-service"
  cluster         = aws_ecs_cluster.cmdb_cluster.arn
  task_definition = aws_ecs_task_definition.cmdb_td.arn
  desired_count   = 1
  #Health Check need to go up?
  health_check_grace_period_seconds = 60
  wait_for_steady_state             = false
  force_new_deployment              = true

  triggers = {
    redeployment = var.timestamp
  }

  network_configuration {
    security_groups  = [data.aws_security_group.app.id]
    subnets          = data.aws_subnets.app.ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.app.id
    container_name   = "${var.application}-${var.target_env}-definition"
    container_port   = var.app_port
  }

  depends_on = [data.aws_alb_listener.front_end, aws_iam_role_policy_attachment.ecs_task_execution_role]

  lifecycle {
    ignore_changes = [capacity_provider_strategy]
  }

}
