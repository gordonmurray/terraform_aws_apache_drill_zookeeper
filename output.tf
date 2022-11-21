output "drill_node_ips" {
  value = aws_instance.drill.*.public_ip
}
