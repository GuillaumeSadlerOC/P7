variable "vpc_id" {
    description = "(Required) VPC ID"
    type = string
    default = null
}

##################################
# SECURITY GROUP
##################################
variable "sg_name" {
  description = "(Optional, Forces new resource) The name of the security group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}

variable "sg_name_prefix" {
  description = "(Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "sg_description" {
  description = "(Optional, Forces new resource) The security group description. Defaults to 'Managed by Terraform'. Cannot be ''. NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags."
  type        = string
  default     = null
}

variable "sg_revoke_rules_on_delete" {
  description = "(Optional) Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first."
  type        = bool
  default     = false
}

variable "sg_vpc_id" {
  description = "(Optional, Forces new resource) The VPC ID."
  type        = string
  default     = null
}

variable "sg_tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

##################################
# SECURITY GROUP RULE
##################################
variable "ingress" {
    description = "(Required)"
    type = list(map(string))
    default = null
}

variable "egress" {
    description = "(Required)"
    type = list(map(string))
    default = null
}

variable "sg_rule_type" {
  description = "(Required) The type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
  type        = string
  default     = null
}

variable "sg_rule_cidr_blocks" {
  description = "(Optional) List of CIDR blocks. Cannot be specified with source_security_group_id"
  type        = string
  default     = null
}

variable "sg_rule_ipv6_cidr_blocks" {
  description = "(Optional) List of IPv6 CIDR blocks."
  type        = string
  default     = null
}

variable "sg_rule_prefix_list_ids" {
  description = "(Optional) List of Prefix List IDs."
  type        = string
  default     = null
}

variable "sg_rule_description" {
  description = "Description of the rule"
  type        = string
  default     = null
}

variable "sg_rule_from_port" {
  description = "(Required) The start port (or ICMP type number if protocol is 'icmp' or 'icmpv6')."
  type        = string
  default     = null
}

variable "sg_rule_protocol" {
  description = "(Required) The protocol. If not icmp, icmpv6, tcp, udp, or all use the protocol number"
  type        = string
  default     = null
}

variable "sg_rule_security_group_id" {
  description = "(Required) The security group to apply this rule to."
  type        = string
  default     = null
}

variable "sg_rule_source_security_group_id" {
  description = "(Optional) The security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks and self."
  type        = string
  default     = null
}

variable "sg_rule_self" {
  description = "(Optional) If true, the security group itself will be added as a source to this ingress rule. Cannot be specified with source_security_group_id."
  type        = string
  default     = null
}

variable "sg_rule_to_port" {
  description = "(Required) The end port (or ICMP code if protocol is 'icmp')."
  type        = string
  default     = null
}
