resource "aws_instance" "minikube" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.hlwrd_pub_1.id
  vpc_security_group_ids = [aws_security_group.HelloWorld_SG.id]

  tags = {
    Name = "Minikube-Instance"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }
}
output "PublicIP" {
  value = aws_instance.minikube.public_ip
}