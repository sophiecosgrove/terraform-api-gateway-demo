output "bucket" {
  value = aws_s3_bucket.app_bucket.id
}

output "bucket_region" {
  value = aws_s3_bucket.app_bucket.region
}