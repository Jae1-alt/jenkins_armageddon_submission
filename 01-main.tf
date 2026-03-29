resource "aws_s3_bucket" "website" {
  bucket_prefix = "jae-armageddon-032626"
  force_destroy = true

  tags = {
    Name = "Armageddon_bucket"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_object" "index" {
  for_each = var.s3-objects

  bucket       = aws_s3_bucket.website.bucket
  key          = each.value.key
  source       = each.value.source
  content_type = each.value.content_type

  etag = filemd5(each.value.source)
}

resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.website.id

  depends_on = [
    aws_s3_bucket_public_access_block.public_access
  ]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = ["s3:GetObject"]
        Resource  = "${aws_s3_bucket.website.arn}/*"
      }
    ]
  })
}
