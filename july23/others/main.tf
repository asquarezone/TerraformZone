resource "aws_s3_bucket" "buckets" {
  for_each = {
    "bucket1" = "qttfstate1"
    "bucket2" = "qttfstate2"
    "bucket3" = "qttfstate3"
  }
  bucket = each.value
  tags = {
    Name = each.value
  }
}