resource "aws_vpc" "Dev" {
  cidr_block = var.vpc_cidr
  tags = {
    name = "My-VPC"

  }

}
resource "aws_subnet" "test" {
  vpc_id     = aws_vpc.Dev.id
  cidr_block = var.subnet_cidr

  tags = {
    name = "My-subnet"
  }
}
