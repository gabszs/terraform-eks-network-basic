output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}

output "nat_gateway_name" {
  value = aws_nat_gateway.this.id
}

output "private_subnets_arn" {
  value = aws_subnet.private_sa_east[*].arn
}

output "public_subnets_arn" {
  value = aws_subnet.public_sa_east[*].arn
}