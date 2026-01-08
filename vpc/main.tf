resource "aws_vpc" "vpc-id" {
    cidr_block    = var.vpc_cidr
    enable_dns_support  = true
    enable_dns_hostnames = true
    tags = merge(var.tags, {name = "vpc-${var.env}"})
  
}


resource "public_subnets" "public_sn" {
  count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.vpc-id.id
  cidr_block              = var.public_subnets[count.index]
  map_public_ip_on_launch  = true

  tags = {
    name = "public_sn-${count.index}- ${var.env}"
  }
}


resource "private_subnets" "private_sn" {
      count                   =length(var.private_subnets)
      vpc_id                  = aws_vpc.vpc_id.id
      cidr_block              = var.private_subnets[count.index]

      tags = {name = "private_sn-${count.index}-${var.env}"} 
  
}

resource "aws_internet_getway" "igw" {
  vpc_id = aws_vpc.vpc_id.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc-id.id
  route = {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_getway.igw.id
  
  }
}

resource "aws_route_table_association" "public_assoc" {
  count = length(public_subnets.public_sn)
  subnet_id = aws_subnet.public_sn[count.index].id
  route_table_id = aws_route_table.public_rt.id
}