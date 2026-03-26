output "s3_bucket_arn" {
  description = "The arn for the created S3 bucket."
  value       = aws_s3_bucket.website.arn
}

output "s3_bucket_url" {
  description = "The URL for the newly created S3 Bucket."
  value       = "https://${aws_s3_bucket.website.bucket_domain_name}"
}