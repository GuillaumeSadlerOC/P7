variable "vpc_name" {
  description = "Name of the VPC, used in vpc tags"
  type        = string
  default     = "default-vpc"
}

variable "availability_zone" {
  description = "A list of availability zones in the region"
  type        = string
  default     = "eu-west-1"
}

variable "common_tags" {
  description = "(Optional) Common tags for all resources"
  type        = map(any)
  default     = null
}

####################################
# VPC     
####################################
variable "cidr_block" {
  description = "The CIDR block for the VPC. Default value is a current VPC value."
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "(Optional) A tenancy option for instances launched into the VPC."
  type        = string
  default     = "default"
}

variable "enable_dns_support" {
  description = "(Optional) A boolean flag to enable/disable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "(Optional) A boolean flag to enable/disable DNS hostnames in the VPC."
  type        = bool
  default     = false
}

variable "enable_classiclink" {
  description = "(Optional) A boolean flag to enable/disable ClassicLink for tge VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = null
}

variable "enable_classiclink_dns_support" {
  description = "(Optional) A boolean flag to enable/disable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic"
  type        = bool
  default     = null
}

variable "assign_generated_ipv6_cidr_block" {
  description = "(Optional) Requests an Amazon-provided IPv6 CIDR bmock with a /56 prefix length for the VPC."
  type        = bool
  default     = false
}

variable "vpc_tags" {
  description = "(Optional) VPC tags"
  type        = map(any)
  default = {
    Name = "default-vpc"
  }
}

####################################
# INTERNET GATEWAY     
####################################
variable "igw_tags" {
  description = "(Optional) Internet Gateway tags"
  type        = map(any)
  default     = null
}

####################################
# PUBLIC ROUTE TABLE     
####################################
variable "public_route_table_tags" {
  description = "(Optional) Public route table tags"
  type        = map(any)
  default     = null
}

####################################
# PRIVATE ROUTE TABLE     
####################################
variable "private_route_table_tags" {
  description = "(Optional) Private route table tags"
  type        = map(any)
  default     = null
}

####################################
# PUBLIC SUBNET     
####################################
variable "public_subnet_tags" {
  description = "(Optional) Public subnet tags"
  type        = map(any)
  default     = null
}

variable "public_subnet_cidr"{
    description = "(Required) Public subnet cidr inside the VPC"
    type = string
    default = "10.0.101.0/24"
}

variable "public_subnet_assign_ipv6_address_on_creation"{
    description = "(Optional) Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. "
    type = bool
    default = false
}

####################################
# PRIVATE SUBNET     
####################################
variable "private_subnet_tags" {
  description = "(Optional) Private subnet tags"
  type        = map(any)
  default     = null
}

variable "private_subnet_cidr"{
    description = "(Required) Private subnet cidr inside the VPC"
    type = string
    default = "10.0.1.0/24"
}

variable "private_subnet_assign_ipv6_address_on_creation"{
    description = "(Optional) Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. "
    type = bool
    default = false
}

####################################
# NAT EIP     
####################################
variable "nat_eip_tags" {
  description = "(Optional) NAT EIP tags"
  type        = map(any)
  default     = null
}

####################################
# NAT GATEWAY     
####################################
variable "nat_gateway_tags" {
  description = "(Optional) NAT Gateway tags"
  type        = map(any)
  default     = null
}
