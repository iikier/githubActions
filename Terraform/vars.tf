variable REGION {
  default = "us-east-1"
}

variable AMIS {
  type = map
  default = {
    us-east-1 = "ami-04b70fa74e45c3917"
  }
}

variable USER {
  default = "ec2-user"
}

variable PUB_KEY {
  default = "dovekey.pub"
}

variable PRIV_KEY {
  default = "dovekey"
}

variable MYIP {
  default = "187.89.105.51/32"
}