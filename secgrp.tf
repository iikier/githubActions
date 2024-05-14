resource "aws_security_group" "HelloWorld_SG" {
  name        = "hello-world-sg"
  description = "Security for Hello World instance "
  vpc_id      = aws_vpc.vpc_helloWorld.id # Attach VPC

  # Regra de entrada permitindo tráfego HTTP (porta 80)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regra de entrada permitindo tráfego SSH (porta 22) apenas de um IP específico
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  # Regra de saída permitindo todo tráfego
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}