output "s3_bucket_arn" {
  description = "The arn for the created S3 bucket."
  value       = aws_s3_bucket.website.arn
}

output "s3_bucket_url" {
  description = "The URL for the newly created S3 Bucket."
  value       = "https://${aws_s3_bucket.website.bucket_domain_name}"
}

output "s3_object_url" {
  description = "Object URL for object in the bucket."
  value = {
    for name, object in aws_s3_object.index : name => "https://${aws_s3_bucket.website.bucket_domain_name}/${object.key}"
  }
}