##################################
# ROUTE 53 ZONE
##################################
variable "zone_name" {
    description = "(Required) This is the name of the hosted zone."
    type = string
    default = null
}

##################################
# ROUTE 53 RECORD
##################################
variable "zone_id" {
    description = "(Required) The ID of the hosted zone to contain this record."
    type = string
    default = null
}

variable "records" {
  description = "List of maps of DNS records"
  type        = any
  default     = []
}
