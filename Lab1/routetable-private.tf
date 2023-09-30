resource "aws_route_table" "private_routetable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gateway.id
  }

  tags = {
    Name = "my-routetable-2"
  }
}

resource "aws_route_table_association" "private-subnet-associate-useast1b" {
  subnet_id      = aws_subnet.private-subnet-useast1b.id 
  route_table_id = aws_route_table.private_routetable.id
  
}


resource "aws_route_table_association" "private-subnet-associate-useast1a" {
  subnet_id      = aws_subnet.private-subnet-useast1a.id
  route_table_id = aws_route_table.private_routetable.id
 
}
