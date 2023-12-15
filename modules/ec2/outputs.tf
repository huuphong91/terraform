output "ec2_public_ips" {
  value = aws_eip.eip.*.public_ip
}