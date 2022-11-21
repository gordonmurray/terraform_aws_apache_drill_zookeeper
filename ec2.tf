data "aws_ami" "zookeeper" {
  most_recent = true

  filter {
    name   = "name"
    values = ["zookeeper"]
  }

  owners = [var.aws_account_id]
}

data "aws_ami" "drill" {
  most_recent = true

  filter {
    name   = "name"
    values = ["drill"]
  }

  owners = [var.aws_account_id]
}

resource "aws_instance" "zookeeper" {
  ami                     = data.aws_ami.zookeeper.id
  instance_type           = "r6g.large"
  key_name                = aws_key_pair.key.key_name
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = [aws_security_group.zookeeper.id]
  disable_api_termination = true

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = "100"
    volume_type           = "gp3"
  }

  tags = {
    Name = "zookeeper"
  }

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

}

data "template_file" "drill" {
  template = file("./files/startup.sh")
  vars = {
    zookeeper_private_ip = aws_instance.zookeeper.private_ip
  }
}

resource "aws_instance" "drill" {
  count                   = 3
  ami                     = data.aws_ami.drill.id
  instance_type           = "r6g.large"
  key_name                = aws_key_pair.key.key_name
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = [aws_security_group.drill.id]
  disable_api_termination = true

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = "100"
    volume_type           = "gp3"
  }

  tags = {
    Name = "drill"
  }

  user_data = data.template_file.drill.rendered

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  depends_on = [aws_instance.zookeeper]

}
