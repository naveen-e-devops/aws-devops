resource "aws_instance" "ec2" {
  ami             = XXXXXXX       # give ami id 
  instance_type   = t2.micro      # instance type
  security_groups = ["XXXXXXXX"]  # security group name
  key_name        = "XXXXXXXXXXX" # key-pair
  tags = {
    Name    = "HelloWorld"
    Env     = "Test"
    project = "pokemon"
  }
}
