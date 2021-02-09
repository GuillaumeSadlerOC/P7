##################################
# SECURITY GROUP
##################################
output "id" {
  description = "The ID of the security group"
  value       = aws_security_group.this.id
}

output "arn" {
  description = "The ARN of the security group"
  value       = aws_security_group.this.arn
}

output "vpc_id" {
  description = "The VPC ID"
  value       = aws_security_group.this.vpc_id
}

output "owner_id" {
  description = "The owner ID"
  value       = aws_security_group.this.owner_id
}

output "name" {
  description = "The name of the security group"
  value       = aws_security_group.this.name
}

output "description" {
  description = "The description of the security group"
  value       = aws_security_group.this.description
}

output "ingress" {
  description = "The ingress rules. See above for more."
  value       = aws_security_group.this.ingress
}

output "egress" {
  description = "The egress rules. See above for more."
  value       = aws_security_group.this.egress
}

##################################
# SECURITY GROUP RULE
##################################
output "ids" {
  description = "The ID of the security group rule"
  value       = aws_security_group_rule.ingress_sg.*.id
}

output "types" {
  description = "The type of rule, ingress or egress"
  value       = aws_security_group_rule.ingress_sg.*.type
}

output "from_ports" {
  description = "The start port (or ICMP type number if protocol is 'icmp')"
  value       = aws_security_group_rule.ingress_sg.*.from_port
}

output "protocols" {
  description = "The protocol used"
  value       = aws_security_group_rule.ingress_sg.*.protocol
}

output "descriptions" {
  description = "Description of the rule"
  value       = aws_security_group_rule.ingress_sg.*.description
}
