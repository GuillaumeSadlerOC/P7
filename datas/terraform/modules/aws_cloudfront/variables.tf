####################################
# CLOUDFRONT DISTRIBUTION     
####################################
variable "create_origin_access_identity" {
    description = "Controls if CloudFront origin access identity should be created"
    type        = bool
    default     = false
}

variable "origin_access_identities" {
    description = "Map of CloudFront origin access identities (value as a comment)"
    type        = map(string)
    default     = {}
}

variable "aliases" {
    description = "(Optional) - Extra CNAMEs (alternate domain names), if any, for this distribution."
    type = list(string)
    default = null
}

variable "comment" {
    description = "(Optional) - Any comments you want to include about the distribution."
    type = string
    default = null
}

variable "custom_error_response" {
    description = "(Optional) - One or more custom error response elements (multiples allowed)."
    type = any
    default = {}
}

variable "default_cache_behavior" {
    description = "(Required) - The default cache behavior for this distribution (maximum one)."
    type = any
    default = null
}

variable "default_root_object" {
    description = "(Optional) - The object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
    type = string
    default = null
}

variable "enabled" {
    description = "(Required) - Whether the distribution is enabled to accept end user requests for content."
    type = bool
    default = true
}

variable "is_ipv6_enabled" {
    description = "(Optional) - Whether the IPv6 is enabled for the distribution."
    type = bool
    default = null
}

variable "http_version" {
    description = "(Optional) - The maximum HTTP version to support on the distribution. Allowed values are http1.1 and http2. The default is http2."
    type = string
    default = "http2"

}

variable "logging_config" {
    description = "(Optional) - The logging configuration that controls how logs are written to your distribution (maximum one)."
    type = any
    default = {}
}

variable "ordered_cache_behavior" {
    description = "(Optional) - An ordered list of cache behaviors resource for this distribution. List from top to bottom in order of precedence. The topmost cache behavior will have precedence 0."
    type = list(any)
    default = []
}

variable "origin" {
    description = "(Required) - One or more origins for this distribution (multiples allowed)."
    type = any
    default = null
}

variable "origin_group" {
    description = "(Optional) - One or more origin_group for this distribution (multiples allowed)."
    type = any
    default = {}
}

variable "price_class" {
    description = "(Optional) - The price class for this distribution. One of PriceClass_All, PriceClass_200, PriceClass_100"
    type = string
    default = null
}

variable "geo_restrictions" {
    description = "(Required) - The restriction configuration for this distribution (maximum one)."
    type = any
    default = {}
}

variable "tags" {
    description = "(Optional) A map of tags to assign to the resource."
    type = map(string)
    default = null
}

variable "viewer_certificate" {
    description = "(Required) - The SSL configuration for this distribution (maximum one)."
    type = any
    default = {
        cloudfront_default_certificate = true
        minimum_protocole_version = "TLSv1"
    }
}

variable "web_acl_id" {
    description = "(Optional) - A unique identifier that specifies the AWS WAF web ACL, if any, to associate with this distribution."
    type = string
    default = null
}

variable "retain_on_delete" {
    description = "(Optional) - Disables the distribution instead of deleting it when destroying the resource through Terraform. If this is set, the distribution needs to be deleted manually afterwards. Default: false."
    type = bool
    default = false
}

variable "wait_for_deployment" {
    description = "(Optional) - If enabled, the resource will wait for the distribution status to change from InProgress to Deployed. Setting this tofalse will skip the process. Default: true."
    type = bool
    default = true
}
