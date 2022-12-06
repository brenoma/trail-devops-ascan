resource "aws_key_pair" "aws-key" {
  key_name = "aws_key"
  public_key = var.PUBLIC_KEY_SSH
}

resource "aws_instance" "nginx_server" {
  ami = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnets[0].id
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  key_name = aws_key_pair.aws-key.id

  provisioner "file" {
    source = "nginx.sh"
    destination = "/tmp/nginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/nginx.sh",
      "sudo /tmp/nginx.sh"
    ]
  }

  connection {
    type = "ssh"
    host = self.public_ip
    user = var.EC2_USER
    private_key = var.PRIVATE_KEY_PATH
  }

  tags = {
    Name = "nginx-server"
  }
}

