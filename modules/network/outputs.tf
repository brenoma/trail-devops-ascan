#Module      : NETWORK
#Description : Terraform module to create public, private and public-private subnets, route table, internet gateway.

output "subnet-id" {
  value       = aws_subnet.subnets.*.id
  description = "The ID of the subnet."
}

output "sg-id" {
  value = aws_security_group.sg.id
  description = "The ID of the Security Group."
}
