resource "aws_instance" "server" {
  ami           = "ami-0ed59cbb87dfa8dba"
  availability_zone = "us-east-1a"
  instance_type = "t2.medium"

  tags = {
    Name = "Reddy"
  }
lifecycle {
    create_before_destroy = true
    ignore_changes = [tags]
  }

  
}