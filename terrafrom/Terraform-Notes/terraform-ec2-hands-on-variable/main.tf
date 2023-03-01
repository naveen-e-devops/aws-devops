resource "aws_instance" "ec2" {
  ami             = var.ami          # give ami id 
  instance_type   = var.instanceType # instance type
  security_groups = [var.sg]         # security group name
  key_name        = var.keyname      # key-pair
  tags = {
    Name    = "HelloWorld"
    Env     = "Test"
    project = "pokemon"
  }
}
