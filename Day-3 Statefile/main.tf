resource "aws_instance" "Cloud" {
    ami = "ami-097855b862d5b1eb2"
    instance_type = "t2.micro"
    availability_zone = "us-east-1a"
    tags = {
        Name = "Cloud"
    }
}
resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
  
}
resource "aws_subnet" "name" {
  vpc_id     = aws_vpc.name.id
  cidr_block = "10.0.1.0/24"
}
