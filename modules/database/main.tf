locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

resource "aws_security_group" "rds_sg" {
  name   = "${local.name_prefix}-rds-sg"
  vpc_id = var.vpc_id
  tags   = merge(var.common_tags, { Name = "${local.name_prefix}-rds-sg" })

  ingress {
    protocol        = "tcp"
    from_port       = 3306
    to_port         = 3306
    security_groups = [var.ec2_sg_id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ssm_parameter" "db_username" {
  name  = "/${var.project_name}/${var.environment}/db/username"
  type  = "String"
  value = var.db_username
  tags  = var.common_tags
}

resource "aws_ssm_parameter" "db_password" {
  name  = "/${var.project_name}/${var.environment}/db/password"
  type  = "SecureString"
  value = var.db_password
  tags  = var.common_tags
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${local.name_prefix}-db-subnet-group"
  subnet_ids = [var.private_subnet_id, var.private_subnet_id_2]
  tags       = var.common_tags
}

resource "aws_db_instance" "myappdb" {
  identifier             = "${local.name_prefix}-mysql"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = var.db_instance_class
  allocated_storage      = 20
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot    = true
  publicly_accessible    = false
  tags                   = var.common_tags
}
