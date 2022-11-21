resource "aws_security_group_rule" "drill_self_1" {
  type              = "ingress"
  from_port         = 0
  to_port           = 31010
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.drill.id
  description       = "Self"
}

resource "aws_security_group_rule" "drill_self_2" {
  type              = "ingress"
  from_port         = 0
  to_port           = 31011
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.drill.id
  description       = "Self"
}

resource "aws_security_group_rule" "drill_self_3" {
  type              = "ingress"
  from_port         = 0
  to_port           = 31012
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.drill.id
  description       = "Self"
}

resource "aws_security_group_rule" "drill_http" {
  type              = "ingress"
  from_port         = 8047
  to_port           = 8047
  protocol          = "tcp"
  cidr_blocks       = ["${var.my_ip_address}/32"]
  security_group_id = aws_security_group.drill.id
  description       = "HTTP"
}

resource "aws_security_group_rule" "drill_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.my_ip_address}/32"]
  security_group_id = aws_security_group.drill.id
  description       = "SSH access"
}

resource "aws_security_group_rule" "drill_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "all"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.drill.id
  description       = "Allow all out"
}
