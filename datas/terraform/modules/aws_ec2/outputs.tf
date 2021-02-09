#############################
#         KEY PAIR          #
#############################
output "key_pair_id" {
    description = "The key pair name."
    value = aws_key_pair.this.id
}

output "key_pair_arn" {
    description = "The key pair ARN."
    value = aws_key_pair.this.arn
}

output "key_pair_kp_name" {
    description = "The key pair name."
    value = aws_key_pair.this.key_name
}

output "key_pair_kp_id" {
    description = "The key pair ID."
    value = aws_key_pair.this.key_pair_id
}

output "key_pair_fingerprint" {
    description = "The MD5 public key fingerprint as specified in section 4 of RFC 4716."
    value = aws_key_pair.this.fingerprint
}

#############################
#       EC2 INSTANCE        #
#############################
output "arn" {
    description = "The ARN of the instance."
    value = aws_instance.this.arn
}

output "instance_state" {
    description = "The state of the instance. One of: pending, running, shutting-down, terminated, stopping, stopped. See Instance Lifecycle for more information."
    value = aws_instance.this.instance_state
}

output "outpost_arn" {
    description = "The ARN of the Outpost the instance is assigned to."
    value = aws_instance.this.outpost_arn
}

output "password_data" {
    description = "Base-64 encoded encrypted password data for the instance. Useful for getting the administrator password for instances running Microsoft Windows. This attribute is only exported if get_password_data is true. Note that this encrypted value will be stored in the state file, as with all exported attributes. See GetPasswordData for more information."
    value = aws_instance.this.password_data
}

output "primary_network_interface_id" {
    description = "The ID of the instance's primary network interface."
    value = aws_instance.this.primary_network_interface_id
}

output "private_dns" {
    description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC."
    value = aws_instance.this.private_dns
}

output "public_dns" {
    description = "The public DNS name assigned to the instance. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC."
    value = aws_instance.this.public_dns
}

output "public_ip" {
    description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use public_ip as this field will change after the EIP is attached."
    value = aws_instance.this.public_ip
}
