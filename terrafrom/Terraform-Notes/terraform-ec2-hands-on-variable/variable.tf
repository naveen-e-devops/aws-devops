variable "ami" {
  default = "ami-0f8ca728008ff5af4"
}

variable "instanceType" {
  default = "t2.micro"
}

variable "sg" {
  default = "ec2-sg"
}

variable "keyname" {
  default = "awsdevops-mum.key"
}