resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
variable "ami" {
  default = "ami-0f8ca728008ff5af4"
}

variable "instanceType" {
  default = "t2.micro"
}

resource "aws_instance" "instance" {
  ami             = var.ami          # give ami id 
  instance_type   = var.instanceType # instance type
  security_groups = ["web-sg"]         # security group name
  key_name        = "terraform-key"      # key-pair
  tags = {
    Name    = "HelloWorld"
    Env     = "Test"
    project = "pokemon"
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./terraform-key.pem")
    host     = self.public_ip
    #host_key = "false"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install nginx -y",
    ]
  }
  
}
