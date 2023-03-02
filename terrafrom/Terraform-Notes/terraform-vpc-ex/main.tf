resource "aws_vpc" "sbi" {
  cidr_block       = var.vpccidr
  instance_tenancy = "default"

  tags = {
    Name = "sbi"
  }
}

resource "aws_subnet" "sbi_private" {
  vpc_id     = aws_vpc.sbi.id
  cidr_block = var.pricidr

  tags = {
    Name = "sbi_private"
  }
}

resource "aws_subnet" "sbi_public" {
  vpc_id     = aws_vpc.sbi.id
  cidr_block = var.pubcidr

  tags = {
    Name = "sbi_public"
  }
}

resource "aws_internet_gateway" "sbi_igw" {
  vpc_id = aws_vpc.sbi.id

  tags = {
    Name = "sbi_ig"
  }
}

resource "aws_route_table" "sbi_igw_rt" {
  vpc_id = aws_vpc.sbi.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sbi_igw.id
  }

  tags = {
    Name = "sbi_igw_rt"
  }
}

resource "aws_route_table_association" "sbi_association" {
  subnet_id      = aws_subnet.sbi_public.id
  route_table_id = aws_route_table.sbi_igw_rt.id
}