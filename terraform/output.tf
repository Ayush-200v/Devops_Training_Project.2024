output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id" {
  value = aws_subnet.private.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}

output "public_instance_id" {
  value = aws_instance.public.id
}

output "private_instance_id" {
  value = aws_instance.private.id
}

output "public_instance_public_ip" {
  value       = aws_instance.public.public_ip
  description = "The public IP of the EC2 instance in the public subnet"
}

output "private_instance_private_ip" {
  value       = aws_instance.private.private_ip
  description = "The private IP of the EC2 instance in the private subnet"
}