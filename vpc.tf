resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route" "PublicRoute" {
  route_table_id         = aws_route_table.PublicRT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "PublicRTassociation" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.PublicRT.id
}
