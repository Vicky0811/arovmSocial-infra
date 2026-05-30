locals {
  name_prefix = "${var.project_name}-${var.environment}"
}

resource "aws_security_group" "myapp_sg" {
  name        = "${local.name_prefix}-ec2-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = var.vpc_id
  tags        = merge(var.common_tags, { Name = "${local.name_prefix}-ec2-sg" })

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "myapp_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "myapp_key_pair" {
  key_name   = "${local.name_prefix}-keypair"
  public_key = tls_private_key.myapp_key.public_key_openssh
  tags       = var.common_tags
}

resource "local_file" "private_key" {
  content         = tls_private_key.myapp_key.private_key_pem
  filename        = "${path.module}/${local.name_prefix}-keypair.pem"
  file_permission = "0400"
}

resource "aws_iam_role" "ec2_role" {
  name = "${local.name_prefix}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })

  tags = var.common_tags
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${local.name_prefix}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "launch_template" "myapp_lt" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  key_name                    = aws_key_pair.myapp_key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.myapp_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true

  root_block_device {
    volume_size           = var.ec2_volume_size
    volume_type           = "gp3"
    delete_on_termination = true
    encrypted             = true
    tags                  = merge(var.common_tags, { Name = "${local.name_prefix}-root-volume" })
  }

  tags = merge(var.common_tags, { Name = "${local.name_prefix}-ec2" })
}
