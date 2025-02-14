output "public_subnet_ids" {
  description = "Public Subnets IDs in the VPC"
  value       = [
    aws_subnet.public01.id,
    aws_subnet.public02.id
  ]
}

output "private_subnet_ids" {
  description = "Private Subnets IDs in the VPC"
  value       = [
    aws_subnet.private01.id,
    aws_subnet.private02.id
  ]
}


output "security_groups" {
  description = "Security group for the cluster control plane communication with worker nodes"
  value       = aws_security_group.control_plane.id
}

output "vpc_id" {
  description = "The VPC Id"
  value       = aws_vpc.main.id
}
