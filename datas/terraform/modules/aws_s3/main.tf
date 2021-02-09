####################################
# AWS S3 MODULE
# For more information go to : https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
# /!\ Don't change variable values in this file but directly on the bloc module of this Terraform module.
# Last modification date : 09/02/2021
####################################

####################################
# BUCKET     
####################################
resource "aws_s3_bucket" "this" {
    
    bucket =                var.bucket
    bucket_prefix =         var.bucket_prefix
    acl =                   var.acl
    tags =                  var.tags
    force_destroy =         var.force_destroy
    acceleration_status =   var.acceleration_status
    request_payer =         var.request_payer

    policy = <<POLICY
    {
        "Version":"2012-10-17",
        "Statement":[{
            "Sid":"PublicReadForGetBucketObjects",
            "Effect":"Allow",
            "Principal": "*",
            "Action":"s3:GetObject",
            "Resource":["arn:aws:s3:::${var.bucket}/*"]
        }]
    }
    POLICY

    versioning {
        enabled = var.enabled
        mfa_delete = var.mfa_delete 
    }
}
