resource "aws_nat_gateway" "gateway" {
  allocation_id = aws_eip.aws_eip.id
  subnet_id = aws_subnet.public-subnet-useast1a.id

  tags = {
    Name = "gw NAT"
  }

}

resource "aws_eip" "aws_eip"{
    tags = {
        Name = "nat_eip"
    }
}