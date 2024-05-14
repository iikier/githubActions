variable "REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-04b70fa74e45c3917"
  }
}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "yes.pub"
}

variable "PRIV_KEY" {
  default = "yes"
}

variable "MYIP" {
  default = "187.89.105.51/32"
}