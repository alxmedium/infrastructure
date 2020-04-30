resource "aws_internet_gateway" "alxmedium_internet_gateway" {
  vpc_id = aws_vpc.alxmedium_vpc.id

  tags = {
    Name = "alxmedium_internet_gateway_route_table_subnet_1"
  }
}