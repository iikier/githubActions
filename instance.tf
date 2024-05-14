resource "aws_instance" "minikube" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.hlwrd_pub_1.id
  vpc_security_group_ids = [aws_security_group.HelloWorld_SG.id]

  tags = {
    Name = "Minikube-Instance"
  }

  user_data = <<-EOF
              sudo apt-get update -y
              sudo apt-get install ca-certificates curl -y
              sudo install -m 0755 -d /etc/apt/keyrings
              sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
              sudo chmod a+r /etc/apt/keyrings/docker.asc

              # Add the repository to Apt sources:
              echo \
              "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
              $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
              sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
              sudo apt-get update -y

              sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

              # Instala o Minikube
              sudo apt-get install -y curl
              curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
              # Inicia o Minikube
              sudo minikube start --driver=none
              # Instala o kubectl
              snap install kubectl --classic
              # Implantar o Nginx
              kubectl create deployment nginx --image=nginx
              kubectl expose deployment nginx --port=80 --type=NodePort
              EOF
}

output "PublicIP" {
  value = aws_instance.minikube.public_ip
}