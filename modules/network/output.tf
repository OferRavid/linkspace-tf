
output "output-public-subnet-obj" {
  value = aws_subnet.public-subnet
}
output "output-public-rt-id" {
  value = aws_route_table.public.id
}
output "output-public-subnet-number" {
  value = var.public-subnet-number
}
output "output-private-subnet-obj" {
  value = aws_subnet.private-subnet
}
output "output-private-subnet-number" {
  value = var.private-subnet-number
}
