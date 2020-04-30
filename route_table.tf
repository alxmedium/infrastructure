resource "aws_route_table" "alxmedium_route_table_subnet_1" {
  vpc_id = aws_vpc.alxmedium_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alxmedium_internet_gateway.id
  }

  tags = {
    Name = "alxmedium_route_table_subnet_1"
  }
}

resource "aws_route_table_association" "alxmedium_subnet_1_route_table_association" {
  subnet_id      = aws_subnet.alxmedium_subnet_1.id
  route_table_id = aws_route_table.alxmedium_route_table_subnet_1.id
}

resource "aws_route_table" "alxmedium_route_table_subnet_2" {
  vpc_id = aws_vpc.alxmedium_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.alxmedium_internet_gateway.id
  }

  tags = {
    Name = "alxmedium_route_table_subnet_2"
  }
}

resource "aws_route_table_association" "alxmedium_subnet_2_route_table_association" {
  subnet_id      = aws_subnet.alxmedium_subnet_2.id
  route_table_id = aws_route_table.alxmedium_route_table_subnet_2.id
}