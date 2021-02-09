####################################
# VPC     
####################################
output "vpc_arn" {
  description = "Amazon Resource Name (ARN) of VPC"
  value       = aws_vpc.this.arn
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.this.cidr_block
}

output "vpc_instance_tenancy" {
  description = "Tenancy of instances spin up within VPC"
  value       = aws_vpc.this.instance_tenancy
}

output "vpc_enable_dns_support" {
  description = "Whether or not the VPC has DNS support"
  value       = aws_vpc.this.enable_dns_support
}

output "vpc_enable_dns_hostnames" {
  description = "Whether or not the VPC has DNS hostname support"
  value       = aws_vpc.this.enable_dns_hostnames
}

output "vpc_enable_classiclink" {
  description = "Whether or not the VPC has Classiclink enabled"
  value       = aws_vpc.this.enable_classiclink
}

output "vpc_main_route_table_id" {
  description = "The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an aws_main_route_table_association"
  value       = aws_vpc.this.main_route_table_id
}

output "vpc_default_network_acl_id" {
  description = "The ID of the network ACL created by default on VPC creation"
  value       = aws_vpc.this.default_network_acl_id
}

output "vpc_default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = aws_vpc.this.default_security_group_id
}

output "vpc_default_route_table_id" {
  description = "The ID of the route table created by default on VPC creation"
  value       = aws_vpc.this.default_route_table_id
}

output "vpc_owner_id" {
  description = "The ID of the AWS account that owns the VPC"
  value       = aws_vpc.this.owner_id
}

####################################
# INTERNET GATEWAY     
####################################
output "igw_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.this.id
}

output "igw_arn" {
  description = "The ARN of the Internet Gateway."
  value       = aws_internet_gateway.this.arn
}

output "igw_owner_id" {
  description = "The ID of the AWS account that owns the internet gateway."
  value       = aws_internet_gateway.this.owner_id
}

####################################
# NAT EIP     
####################################
output "nat_eip_id" {
  description = "Contains the EIP allocation ID"
  value       = aws_eip.this.id
}

output "nat_eip_private_ip" {
  description = "Contains the private IP address (if in VPC)."
  value       = aws_eip.this.private_ip
}

output "nat_eip_private_dns" {
  description = "The Private DNS associated with the Elastic IP address (if in VPC)."
  value       = aws_eip.this.private_dns
}

output "nat_eip_associate_with_private_ip" {
  description = "Contains the user specified private IP address (if in VPC)."
  value       = aws_eip.this.associate_with_private_ip
}

output "nat_eip_public_ip" {
  description = "Contains the public IP address."
  value       = aws_eip.this.public_ip
}

output "nat_eip_public_dns" {
  description = "Public DNS associated with the Elastic IP address."
  value       = aws_eip.this.public_dns
}

output "nat_eip_instance" {
  description = "Contains the ID of the attached instance"
  value       = aws_eip.this.instance
}

output "nat_eip_network_interface" {
  description = "Contains the ID of the attached network interface"
  value       = aws_eip.this.network_interface
}

output "nat_eip_public_ipv4_pool" {
  description = "EC2 IPv4 address pool identifier (if in VPC)."
  value       = aws_eip.this.public_ipv4_pool
}

output "nat_eip_customer_owned_ipv4_pool" {
  description = "The ID of a customer-owned address pool. For more on customer owned IP addressed check out Customer-owned IP addresses guide."
  value       = aws_eip.this.customer_owned_ipv4_pool
}

output "nat_eip_customer_owned_ip" {
  description = "Customer owned IP."
  value       = aws_eip.this.customer_owned_ip
}

output "nat_eip_domain" {
  description = "Indicates if this EIP is for use in VPC (vpc) or EC2 Classic (standard)."
  value       = aws_eip.this.domain
}

####################################
# PUBLIC ROUTE TABLE     
####################################
output "public_route_table_id" {
  description = "ID of the public route table"
  value       = aws_route_table.public.id
}

output "public_route_table_owner_id" {
  description = "The ID of the AWS account that owns the route table"
  value       = aws_route_table.public.owner_id
}

####################################
# PUBLIC ROUTES     
####################################
output "public_igw_route_id" {
  description = "ID of the internet gateway route."
  value       = aws_route.public_internet_gateway.id
}

####################################
# PRIVATE ROUTE TABLE     
####################################
output "private_route_table_id" {
  description = "ID of private route tables"
  value       = aws_route_table.private.id
}

output "private_route_table_owner_id" {
  description = "ID of the AWS account that owns the route table"
  value       = aws_route_table.private.owner_id
}

####################################
# PUBLIC SUBNET     
####################################
output "public_subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.public.id
}

output "public_subnet_arn" {
  description = "The ARN of the subnet"
  value       = aws_subnet.public.arn
}

output "public_subnet_ipv6_cidr_block_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = aws_subnet.public.ipv6_cidr_block_association_id
}

output "public_subnet_owner_id" {
  description = "The ID of the AWS account that owns the subnet"
  value       = aws_subnet.public.owner_id
}

####################################
# PRIVATE SUBNET     
####################################
output "private_subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.private.id
}

output "private_subnet_arn" {
  description = "The ARN of the subnet"
  value       = aws_subnet.private.arn
}

output "private_subnet_ipv6_cidr_block_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = aws_subnet.private.ipv6_cidr_block_association_id
}

output "private_subnet_owner_id" {
  description = "The ID of the AWS account that owns the subnet"
  value       = aws_subnet.private.owner_id
}
