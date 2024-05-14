resource "aws_vpc" "vpc_helloWorld" {
  cidr_block = "10.0.0.0/16" # VPC padrão AWS
}

resource "aws_subnet" "hlwrd_pub_1" {
  vpc_id                  = aws_vpc.vpc_helloWorld.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "hlwrd_pub_1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_helloWorld.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_helloWorld.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.hlwrd_pub_1.id
  route_table_id = aws_route_table.public.id
}
