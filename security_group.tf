resource "aws_security_group" "drill" {
  name        = "drill"
  description = "drill security group"
  vpc_id      = var.vpc_id
}

resource "aws_security_group" "zookeeper" {
  name        = "zookeeper"
  description = "zookeeper security group"
  vpc_id      = var.vpc_id
}