output "vpc_id" {
    value = aws_vpc.vpc-id.id
     
}

output "public_subnet_ids" {
   value = aws_subnet.public_sn[*].id
  
}


output "private_subnet_ids" {
   value = aws_subnet.private_sn[*].id
}