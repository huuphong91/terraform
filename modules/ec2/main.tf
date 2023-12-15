resource "aws_instance" "ec2_instance" {
  count = var.count_ec2

  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  tags = {
    Name = "EC2Instance-${var.subnet_id}"
  }
}

resource "aws_eip" "eip" {
  count = var.count_eip

  instance = aws_instance.ec2_instance[count.index].id

  tags = {
    Name = "ElasticIP-${var.subnet_id}"
  }
}