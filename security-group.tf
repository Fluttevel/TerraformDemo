# =========| SECURITY GROUPS |=========

# Create Security Group for the Application Load Balancer
# terraform aws create security group
resource "aws_security_group" "demo-instance" {
  name        = "Terraform Demo Instance"
  description = "Enable access on Port 8080"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Access to Port 8080"
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = [var.vpc-cidr-0]
  }
}

# Create Security Group for the Application Load Balancer
# terraform aws create security group
resource "aws_security_group" "alb-security-group" {
  name        = "ALB Security Group"
  description = "Enable HTTP/HTTPS access on Port 80/443"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "HTTP Access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.vpc-cidr-0]
  }

  ingress {
    description      = "HTTP Access"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.vpc-cidr-0]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.vpc-cidr-0]
  }

  tags   = {
    Name = "ALB Security Group"
  }
}

# Create Security Group for the Bastion Host aka Jump Box
# terraform aws create security group
resource "aws_security_group" "ssh-security-group" {
name        = "SSH Access on Port 22"
description = "Enable SSH access on Port 22"
vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${var.ssh-location}"]
}

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.vpc-cidr-0]
  }

  tags   = {
    Name = "SSH Security Group"
  }
}

# Create Security Group for the Web Server
# terraform aws create security group
resource "aws_security_group" "webserver-security-group" {
  name        = "WEB Server Security Group"
  description = "Enable HTTP/HTTPS access [80/443] via ALB and SSH [22] via SSH SGroup"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "HTTP Access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.alb-security-group.id}"]
  }

  ingress {
    description      = "HTTPS Access"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.alb-security-group.id}"]
  }

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = ["${aws_security_group.ssh-security-group.id}"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.vpc-cidr-0]
  }

  tags   = {
    Name = "WEB Server Security Group"
  }
}

# ================================