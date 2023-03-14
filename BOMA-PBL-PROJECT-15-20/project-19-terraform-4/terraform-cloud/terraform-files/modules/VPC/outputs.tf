# OUTPUT FILES THAT WILL BE NEEDED BY OTHER RESOURCES
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "VPC cidr needed by other resources"
}

output "public_subnet-1" {
  value       = aws_subnet.public[0].id
  description = "The first public subnet."
}

output "public_subnet-2" {
  value       = aws_subnet.public[1].id
  description = "The second public subnet."
}

output "private_subnet-1" {
  value       = aws_subnet.private[0].id
  description = "The first private subnet."
}

output "private_subnet-2" {
  value       = aws_subnet.private[1].id
  description = "The second private subnet."
}

output "private_subnet-3" {
  value       = aws_subnet.private[2].id
  description = "The third private subnet."

}

output "private_subnet-4" {
  value       = aws_subnet.private[3].id
  description = "The 4th private subnet."
}

output "instance_profile" {
  value = aws_iam_instance_profile.ip.id
}
