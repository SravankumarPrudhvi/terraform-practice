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
