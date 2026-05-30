resource "aws_s3_bucket" "media" {
  bucket = "${var.project_name}-media-${var.environment}-arovm"
  tags   = var.common_tags
}

resource "aws_s3_bucket_public_access_block" "media" {
  bucket                  = aws_s3_bucket.media.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
