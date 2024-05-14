resource "aws_vpc" "vpc_helloWorld" {
  cidr_block = "10.0.0.0/16" # VPC padrão AWS
}
resource "aws_subnet" "hlwrd_pub_1" {
  vpc_id                  = aws_vpc.vpc_helloWorld.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "hlwrd_pub_1"
  }
}