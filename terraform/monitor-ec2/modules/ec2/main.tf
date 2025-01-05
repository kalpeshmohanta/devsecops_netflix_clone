resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  security_groups = var.security_groups
  availability_zone = var.availability_zone

  root_block_device {
    volume_size = var.ebs_volume_size
    volume_type = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name = var.instance_name
  }
}