##
## VPC
##
resource "aws_vpc" "VPC" {
  cidr_block           = var.vpcCIDRblock
}

##
## Subnets
##

resource "aws_subnet" "subnetA" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SubnetACIDRblock
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}
resource "aws_subnet" "subnetB" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SubnetBCIDRblock
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}
resource "aws_subnet" "subnetC" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SubnetCCIDRblock
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
}
resource "aws_subnet" "subnetD" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.SubnetDCIDRblock
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
}

##
## InternetGateways
##
resource "aws_internet_gateway" "IGW" {
 vpc_id = aws_vpc.VPC.id
} 
resource "aws_route_table" "Public_RT" {
 vpc_id = aws_vpc.VPC.id
}

##
## RouteTables and Associations
##
resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.Public_RT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.IGW.id
}
resource "aws_route_table_association" "Internet_associationA" {
  subnet_id      = aws_subnet.subnetA.id
  route_table_id = aws_route_table.Public_RT.id
}
resource "aws_route_table_association" "Internet_associationB" {
  subnet_id      = aws_subnet.subnetB.id
  route_table_id = aws_route_table.Public_RT.id
}
resource "aws_route_table_association" "Internet_associationC" {
  subnet_id      = aws_subnet.subnetC.id
  route_table_id = aws_route_table.Public_RT.id
}
resource "aws_route_table_association" "Internet_associationD" {
  subnet_id      = aws_subnet.subnetD.id
  route_table_id = aws_route_table.Public_RT.id
}