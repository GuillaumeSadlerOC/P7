##################################
# AWS
##################################
variable "aws_provider_version" {
  description = "(Required) AWS provider version to use."
  type = string
  default = "~> 3.0"
}

variable "aws_default_region" {
  description = "(Required) AWS provider version to use."
  type = string
  default = "eu-west-1"
}

variable "aws_availability_zone" {
  description = "(Required) AWS availability zone for network and memcached resources."
  type = string
  default = "eu-west-1a"
}

variable "aws_default_credentials_path" {
  description = "(Optional) AWS credentials path of file who contain secret and access key."
  type = string
  default = ".aws/credentials"
}

##################################
# PROJECT
##################################
variable "environment" {
  description = "(Required) The name of the environment for aws resources tags."
  type = string
  default = "prod"
}

##################################
# PORTS
##################################
variable "db_port" {
  description = "(Required) Database port for RDS instance and db security group."
  type = number
  default = 3306
}

variable "http_port" {
  description = "(Required) HTTP port for web security group. Don't forget to check ELB listener."
  type = number
  default = 80
}

variable "https_port" {
  description = "(Required) HTTPS port for web security group. Don't forget to check ELB listener."
  type = number
  default = 443
}

variable "ssh_port" {
  description = "(Required) SSH port for web security group. Don't forget to check ELB listener."
  type = number
  default = 22
}

variable "memcached_port" {
  description = "(Required) Memcached port for web security group and memcached resource."
  type = number
  default = 11211
}

##################################
# DATABASE
##################################
variable "db_name" {
  description = "(Required) Database name required for aws rds instance."
  type = string
  default = "defaultdb"
}

variable "db_username" {
  description = "(Required) Database username required for aws rds instance."
  type = string
  default = "defaultuser"
}

variable "db_password" {
  description = "(Required) Database password required for aws rds instance."
  type = string
  default = "YourPwdShouldBeLongAndSecure!"
}
