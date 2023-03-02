provider "aws" {
  region  = "ap-south-1"
  profile = "aws"
}

variable "instancename" {
  type    = list(any)
  default = ["jenkins", "tomcat"]
}

resource "aws_instance" "myinstance" {
  ami             = "xxxx"
  instance_type   = "t2.micro"
  security_groups = ["ec2-sg"]
  count           = 2

  tags = {
    Name = var.instancename[count.index]
  }
}