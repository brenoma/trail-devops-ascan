resource "aws_key_pair" "aws-key" {
  key_name   = "aws_key"
  public_key = var.PUBLIC_KEY_SSH
}

resource "aws_instance" "subs-api" {
  ami                    = var.INSTANCE_AMI
  instance_type          = var.INSTANCE_TYPE
  subnet_id              = var.SUBNET_ID
  vpc_security_group_ids = [var.SG_ID]
  key_name               = aws_key_pair.aws-key.id
  tags                   = {
    Name = "subs-api"
  }
}
