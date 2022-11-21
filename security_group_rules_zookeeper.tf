resource "aws_security_group_rule" "zookeeper_self_1" {
  type              = "ingress"
  from_port         = 0
  to_port           = 2888
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.zookeeper.id
  description       = "Self"
}

resource "aws_security_group_rule" "zookeeper_self_2" {
  type              = "ingress"
  from_port         = 0
  to_port           = 3888
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.zookeeper.id
  description       = "Self"
}

resource "aws_security_group_rule" "zookeeper_http" {
  type                     = "ingress"
  from_port                = 2181
  to_port                  = 2181
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.drill.id
  security_group_id        = aws_security_group.zookeeper.id
  description              = "HTTP"
}

resource "aws_security_group_rule" "zookeeper_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.my_ip_address}/32"]
  security_group_id = aws_security_group.zookeeper.id
  description       = "SSH access"
}

resource "aws_security_group_rule" "zookeeper_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.zookeeper.id
  description       = "Allow all out"
}
