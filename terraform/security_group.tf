resource "aws_security_group" "bastion" {
  name        = "bastion-sg"
  vpc_id      = aws_vpc.main.id
  description = "Allow SSH from my IP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "BastionSG" }
}

resource "aws_security_group" "private_instances" {
  name        = "private-instance-sg"
  vpc_id      = aws_vpc.main.id
  description = "Allow all from VPC"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "PrivateInstanceSG" }
}

resource "aws_security_group" "public_web" {
  name        = "public-web-sg"
  vpc_id      = aws_vpc.main.id
  description = "Allow HTTP from my IP"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [local.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "PublicWebSG" }
}
resource "aws_security_group_rule" "allow_alb_to_jenkins" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_web.id
  security_group_id        = aws_security_group.private_instances.id
  description              = "Allow ALB to access Jenkins on port 8080"
}
