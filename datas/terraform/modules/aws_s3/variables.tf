##################################
# S3 BUCKET
##################################
variable "bucket" {
    description = "(Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name. Must be less than or equal to 63 characters in length."
    type = string
    default = ""
}

variable "bucket_prefix" {
    description = "(Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be less than or equal to 37 characters in length."
    type = string
    default = null
}

variable "acl" {
    description = "(optional) The canned ACL to apply. Defaults to private. Conflicts with grant."
    type = string
    default = "private"
}

variable "policy" {
    description = "(Optional) A valid bucket policy JSON document."
    type = string
    default = null
}

variable "tags" {
    description = "(Optional) A map of tags to assign to the bucket."
    type = map
    default = {
        Name = ""
    }
}

variable "force_destroy" {
    description = " (Optional)  A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
    type = bool
    default = false
}

variable "lifecycle_rule" {
    description = "(Optional) A configuration of object lifecycle management."
    type = string
    default = null
}

variable "acceleration_status" {
    description = "(Optional) Sets the accelerate configuration of an existing bucket."
    type = string
    default = "Suspended"
}

variable "request_payer" {
    description = "(Optional) Specifies who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester."
    type = string
    default = "BucketOwner"
}

variable "target_bucket" {
    type = string
    description = "(Required) The name of the bucket that will receive the log objects"
    default = ""
}

variable "target_prefix" {
    type = string
    description = "(Optionnal) To specify a key prefix for log objets."
    default = "log/"
}

variable "bucket_tags" {
    type = map
    description = "(Optionnal) A mapping of tags to assign to the bucket."
    default = {
        environment = "prod"
        terraform = "true"
    }
}

##################################
# S3 BUCKET > VERSIONING
##################################
variable "enabled" {
    description = "(Optional) Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket."
    type = bool
    default = true
}

variable "mfa_delete" {
    description = "(Optional) Enable MFA delete for either Change the versioning state of your bucket or Permanently delete an object version"
    type = bool
    default = false
}

##################################
# S3 BUCKET > LOGGING
##################################
variable "logging_target_bucket" {
    description = "(Required) The name of the bucket that will receive the log objects."
    type = string
    default = null
}

variable "logging_target_prefix" {
    description = "(Optional) To specify a key prefix for log objects."
    type = string
    default = null
}


##################################
# S3 BUCKET > LIFECYCLE RULE
##################################
variable "id"{
    description = "(Optional) Unique identifier for the rule. Must be less than or equal to 255 characters in length."
    type = string
    default = null
}

variable "prefix"{
    description = "(Optional) Object key prefix identifying one or more objects to which the rule applies."
    type = string
    default = null
}

variable "lifecycle_tags"{
    description = "(Optional) Specifies object tags key and value."
    type = string
    default = null
}

variable "lifecycle_enabled"{
    description = "(Required) Specifies lifecycle rule status."
    type = bool
    default = false
}

variable "abort_incomplete_multipart_upload_days"{
    description = "Optional) Specifies the number of days after initiating a multipart upload when the multipart upload must be completed."
    type = string
    default = null
}

##################################
# S3 BUCKET > LIFECYCLE RULE > EXPIRATION
##################################
variable "expiration_date"{
    description = "(Optional) Specifies the date after which you want the corresponding action to take effect."
    type = string
    default = null
}

variable "expiration_days"{
    description = "(Optional) Specifies the number of days after object creation when the specific rule action takes effect."
    type = string
    default = null
}

variable "expired_object_delete_marker"{
    description = "(Optional) Specifies the number of days after object creation when the specific rule action takes effect."
    type = string
    default = null
}

##################################
# S3 BUCKET > LYFECICLE RULE > TRANSITION
##################################
# (Optional) Specifies a period in the object's transitions
variable "transition_date"{
    description = "(Optional) Specifies the date after which you want the corresponding action to take effect."
    type = string
    default = null
}

variable "transition_days"{
    description = "(Optional) Specifies the number of days after object creation when the specific rule action takes effect."
    type = string
    default = null
}

variable "transition_storage_class"{
    description = "(Required) Specifies the Amazon S3 storage class to which you want the object to transition. Can be ONEZONE_IA, STANDARD_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE."
    type = string
    default = null
}

##################################
# S3 BUCKET > NONCURRENT VERSION EXPIRATION
##################################
# (Optional) Specifies when noncurrent object versions expire
variable "noncurrent_version_expiration_days"{
    description = "(Required) Specifies the number of days noncurrent object versions expire."
    type = string
    default = null
}

##################################
# S3 BUCKET > NONCURRENT VERSION TRANSITIONS
##################################
# (Optional) Specifies when noncurrent object versions transitions
variable "noncurrent_version_transition_days"{
    description = "(Required) Specifies the number of days noncurrent object versions transition."
    type = string
    default = null
}

variable "noncurrent_version_transition_storage_class"{
    description = "(Required) Specifies the Amazon S3 storage class to which you want the noncurrent object versions to transition. Can be ONEZONE_IA, STANDARD_IA, INTELLIGENT_TIERING, GLACIER, or DEEP_ARCHIVE."
    type = string
    default = null
}

##################################
# S3 BUCKET > REPLICATION CONFIGURATION
##################################
variable "replication_configuration" {
    description = "(Optional) A configuration of replication configuration"
    type = string
    default = null
}

variable "object_lock_configuration" {
    description = "(Optional) A configuration of S3 object locking"
    type = string
    default = null
}
