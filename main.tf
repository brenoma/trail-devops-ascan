resource "aws_key_pair" "aws-key" {
  key_name   = "aws_key"
  public_key = var.PUBLIC_KEY_SSH
}

resource "aws_instance" "nginx_server" {
  ami                    = "ami-0574da719dca65348"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnets[0].id
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = aws_key_pair.aws-key.id
  tags = {
    Name = "nginx-server"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.EC2_USER
    private_key = file(var.PRIVATE_KEY_PATH)
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/ubuntu/.scripts"
    ]
  }

  provisioner "file" {
    source      = "scripts/init.sh"
    destination = "/home/ubuntu/.scripts/init.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/.scripts/init.sh",
      "sudo /home/ubuntu/.scripts/init.sh",
    ]
  }
}

data "aws_instance" "nginx-instance" {}

output "nginx-instance-data" {
  public_ip = data.aws_instance.nginx-instance.public_ip,
}
