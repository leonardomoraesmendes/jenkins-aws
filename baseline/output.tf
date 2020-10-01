output "vpc_id" {
  value = aws_vpc.VPC.id
}
output "subnet_id" {
  value       = aws_subnet.subnetA.id
}
output "security_group_id" {
  value       = aws_security_group.project-iac-sg.id
}