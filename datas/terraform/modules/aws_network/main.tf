####################################
# AWS VPC MODULES
# For more information go to : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
# /!\ Don't change variable values in this file but directly on the bloc module of this Terraform module.
# Last modification date : 09/02/2021
####################################

####################################
# VPC     
####################################
resource "aws_vpc" "this" {

  # Required
  cidr_block = var.cidr_block

  # Optional
  instance_tenancy                 = var.instance_tenancy
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block
  tags = merge(
    var.vpc_tags,
    var.common_tags
  )
}

####################################
# INTERNET GATEWAY     
####################################
resource "aws_internet_gateway" "this" {

  # Required
  vpc_id = aws_vpc.this.id

  # Optional
  tags = merge(
    var.igw_tags,
    var.common_tags
  )

  # Requirements
  depends_on = [
    aws_vpc.this
  ]
}

####################################
# PUBLIC ROUTE TABLE     
####################################
resource "aws_route_table" "public" {

  # Required
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.public_route_table_tags,
    var.common_tags
  )

  # Requirements
  depends_on = [
    aws_vpc.this
  ]
}

####################################
# PUBLIC ROUTES     
####################################
resource "aws_route" "public_internet_gateway" {

  # Required
  route_table_id = aws_route_table.public.id

  # Optional
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id

  timeouts {
    create = "5m"
  }
}

####################################
# PRIVATE ROUTE TABLE     
####################################
resource "aws_route_table" "private" {
  # Required
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.private_route_table_tags,
    var.common_tags
  )

}

####################################
# PUBLIC ROUTE TABLE ASSOCIATION    
####################################
resource "aws_route_table_association" "public_subnet" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

####################################
# PUBLIC SUBNET     
####################################
resource "aws_subnet" "public" {

  # Required
  vpc_id     = aws_vpc.this.id
  cidr_block = var.public_subnet_cidr

  # Optional
  availability_zone               = var.availability_zone
  assign_ipv6_address_on_creation = var.public_subnet_assign_ipv6_address_on_creation
  
  tags = merge(
    var.public_subnet_tags,
    var.common_tags
  )
}

####################################
# PRIVATE SUBNET     
####################################
resource "aws_subnet" "private" {

  # Required
  vpc_id     = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr

  # Optional    
  availability_zone               = var.availability_zone
  assign_ipv6_address_on_creation = var.private_subnet_assign_ipv6_address_on_creation

  tags = merge(
    var.public_subnet_tags,
    var.common_tags
  )
}

####################################
# NAT EIP     
####################################
resource "aws_eip" "this" {

  # Optional
  vpc  = true

  tags = merge(
    var.nat_eip_tags,
    var.common_tags
  )

  # Requirements
  depends_on = [
    aws_vpc.this
  ]
}

####################################
# NAT GATEWAY     
####################################
resource "aws_nat_gateway" "this" {

  # Required
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.private.id

  # Optional
  tags = merge(
    var.nat_gateway_tags,
    var.common_tags
  )

  # Requirements
  depends_on = [
    aws_eip.this,
    aws_subnet.private
  ]
}
