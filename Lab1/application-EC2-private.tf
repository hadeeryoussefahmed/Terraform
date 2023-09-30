
resource "aws_instance" "application_ec2-private" {
  ami ="ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private-subnet-useast1b.id
  vpc_security_group_ids = [aws_security_group.sg2.id]
  key_name = aws_key_pair.tf-key-pair-private.id


  tags = {
    Name = "application-ec2-private"
  }
}

