####################################
# CLOUDFRONT DISTRIBUTION     
####################################
output "cloudfront_distribution_id" {
    description = "The identifier for the distribution"
    value = aws_cloudfront_distribution.this.id
}

output "cloudfront_distribution_arn" {
    description = "The ARN (Amazon Resource Name) for the distribution."
    value = aws_cloudfront_distribution.this.arn
}

output "cloudfront_distribution_caller_reference" {
    description = "Internal value used by CloudFront to allow future updates to the distribution configuration."
    value = aws_cloudfront_distribution.this.caller_reference
}

output "cloudfront_distribution_status" {
    description = "The current status of the distribution. Deployed if the distribution's information is fully propagated throughout the Amazon CloudFront system."
    value = aws_cloudfront_distribution.this.status
}

output "cloudfront_distribution_trusted_signers" {
    description = "List of nested attributes for active trusted signers, if the distribution is set up to serve private content with signed URLs."
    value = aws_cloudfront_distribution.this.trusted_signers
}

output "cloudfront_distribution_enabled" {
    description = "true if any of the AWS accounts listed as trusted signers have active CloudFront key pairs."
    value = aws_cloudfront_distribution.this.enabled
}

output "cloudfront_distribution_domain_name" {
    description = "The domain name corresponding to the distribution."
    value = aws_cloudfront_distribution.this.domain_name
}

output "cloudfront_distribution_last_modified_time" {
    description = "The date and time the distribution was last modified."
    value = aws_cloudfront_distribution.this.last_modified_time
}

output "cloudfront_distribution_in_progress_validation_batches" {
    description = "The number of invalidation batches currently in progress."
    value = aws_cloudfront_distribution.this.in_progress_validation_batches
}

output "cloudfront_distribution_etag" {
    description = "The current version of the distribution's information."
    value = aws_cloudfront_distribution.this.etag
}

output "cloudfront_distribution_hosted_zone_id" {
    description = "The CloudFront Route 53 zone ID that can be used to route an Alias Resource Record Set to. This attribute is simply an alias for the zone ID Z2FDTNDATAQYW2."
    value = aws_cloudfront_distribution.this.hosted_zone_id
}
