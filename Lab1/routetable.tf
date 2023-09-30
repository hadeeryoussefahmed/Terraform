resource "aws_route_table" "public_routetable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "my-routetable-1"
  }
}

resource "aws_route_table_association" "public-subnet-associate-useast1b" {
  subnet_id      = aws_subnet.public-subnet-useast1b.id 
  route_table_id = aws_route_table.public_routetable.id
  
}


resource "aws_route_table_association" "public-subnet-associate-useast1a" {
  subnet_id      = aws_subnet.public-subnet-useast1a.id
  route_table_id = aws_route_table.public_routetable.id
 
}


