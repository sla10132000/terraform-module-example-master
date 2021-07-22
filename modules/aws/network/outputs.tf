output "vpc" {
  value = aws_vpc.vpc
}

output "subnet_public" {
  value = aws_subnet.public
}

output "subnet_private" {
  value = aws_subnet.private
}

