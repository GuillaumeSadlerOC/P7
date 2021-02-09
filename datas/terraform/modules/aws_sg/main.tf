####################################
# AWS SECURITY GROUP MODULE
# For more information go to : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# /!\ Don't change variable values in this file but directly on the bloc module of this Terraform module.
# Last modification date : 09/02/2021
####################################

##################################
# SECURITY GROUP
##################################
resource "aws_security_group" "this" {
  name                   = var.sg_name
  description            = var.sg_description
  vpc_id                 = var.sg_vpc_id
  revoke_rules_on_delete = var.sg_revoke_rules_on_delete
  tags                   = var.sg_tags
}

##################################
# SECURITY GROUP RULE > INGRESS
##################################
resource "aws_security_group_rule" "ingress_sg" {
  count = var.ingress != null ? length(var.ingress) : 0

  security_group_id = aws_security_group.this.id
  type              = "ingress"

  cidr_blocks = split(",", lookup(var.ingress[count.index], "cidr_blocks", null))
  from_port   = lookup(var.ingress[count.index], "from_port", null)
  to_port     = lookup(var.ingress[count.index], "to_port", null)
  protocol    = lookup(var.ingress[count.index], "protocol", "tcp")
  description = lookup(var.ingress[count.index], "description", "Ingress Rule")

}

##################################
# SECURITY GROUP RULE > EGRESS
##################################
resource "aws_security_group_rule" "egress_sg" {
  count = var.egress != null ? length(var.egress) : 0

  security_group_id = aws_security_group.this.id
  type              = "egress"

  cidr_blocks = split(",", lookup(var.egress[count.index], "cidr_blocks", null))
  from_port   = lookup(var.egress[count.index], "from_port", null)
  to_port     = lookup(var.egress[count.index], "to_port", null)
  protocol    = lookup(var.egress[count.index], "protocol", "tcp")
  description = lookup(var.egress[count.index], "description", "Egress Rule")

}