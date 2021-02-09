####################################
# AWS ROUTE53 MODULE
# For more information go to : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
# /!\ Don't change variable values in this file but directly on the bloc module of this Terraform module.
# Last modification date : 09/02/2021
####################################

locals {
  # convert from list to map with unique keys
  recordsets = { for rs in var.records : join(" ", compact(["${rs.name} ${rs.type}", lookup(rs, "set_identifier", "")])) => rs }
}

####################################
# ROUTE53 ZONE     
####################################
resource "aws_route53_zone" "primary" {
  name = var.zone_name
}

####################################
# ROUTE53 RECORD     
####################################
resource "aws_route53_record" "this" {
  for_each = local.recordsets
  
  zone_id = aws_route53_zone.primary.zone_id
  
  name = each.value.name
  type = each.value.type
  ttl = lookup(each.value, "ttl", null)
  records = lookup(each.value, "records", null)
  set_identifier = lookup(each.value, "set_identifier", null)

  dynamic "alias" {
    for_each = length(keys(lookup(each.value, "alias", {}))) == 0 ? [] : [true]
    content {
      name = each.value.alias.name
      zone_id = each.value.alias.zone_id
      evaluate_target_health = lookup(each.value.alias, "evaluate_target_health", false)
    }
  }
}
