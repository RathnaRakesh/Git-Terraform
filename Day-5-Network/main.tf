resource "aws_vpc" "cloud" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "server-vpc"
  }


}
resource "aws_subnet" "cloud" {
  vpc_id            = aws_vpc.cloud.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "server-subnet"
  }
}
resource "aws_internet_gateway" "cloud" {
  vpc_id = aws_vpc.cloud.id
  tags = {
    Name = "server-gateway"
  }
}
resource "aws_route_table" "cloud" {
  vpc_id = aws_vpc.cloud.id
  tags = {
    Name = "server-route"
  }
}
resource "security_group" "cloud" {
  name        = "server-security-group"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = aws_vpc.cloud.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


    egress {
    from_port   = 0 
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}




resource "aws_instance" "cloud" {
  ami                    = "ami-0ed59cbb87dfa8dba"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.cloud.id
    vpc_security_group_ids = [aws_security_group.cloud.id]
  tags = {
    Name = "server-instance"
  }
}