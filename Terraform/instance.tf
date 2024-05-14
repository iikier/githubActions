resource "aws_instance" "minikube" {
  ami           = var.AMIS[var.REGION]
  instance_type = "t2.micro" 
  vpc_security_group_ids = [aws_security_group.HelloWorld_SG.id]

  tags = {
    Name = "Minikube-Instance"
  }
}