##################################
# ROUTE 53 ZONE
##################################
output "zone_id" {
    description = "The Hosted Zone ID. This can be referenced by zone records."
    value = aws_route53_zone.primary.zone_id
}

output "zone_name_servers" {
    description = "A list of name servers in associated (or default) "
    value = aws_route53_zone.primary.name_servers
}

##################################
# ROUTE 53 RECORD
##################################
output "this_route53_record_name" {
  description = "The name of the record"
  value       = { for k, v in aws_route53_record.this : k => v.name }
}

output "this_route53_record_fqdn" {
  description = "FQDN built using the zone domain and name"
  value       = { for k, v in aws_route53_record.this : k => v.fqdn }
}