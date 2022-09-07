resource "aws_security_group" "main" {
  name        = "${local.TAG_PREFIX}-sg"
  description = "${local.TAG_PREFIX}-sg"
  vpc_id      =  var.VPC_ID

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "TCP"
    cidr_blocks = var.ALLOW_SG_CIDR
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.TAG_PREFIX}-sg"
  }
}

locals {
  TAG_PREFIX = "${var.COMPONENT}-ami"
}