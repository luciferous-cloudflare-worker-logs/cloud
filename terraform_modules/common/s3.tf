# ================================================================
# Bucket Worker Logs
# ================================================================

resource "aws_s3_bucket" "worker_logs" {
  bucket_prefix = "worker-logs-"
}

data "aws_iam_policy_document" "bucket_policy_worker_logs" {
  statement {
    sid     = "CloudflareLogPush"
    actions = ["s3:PutObject"]
    effect  = "Allow"
    resources = [
      "${aws_s3_bucket.worker_logs.arn}/*"
    ]
    principals {
      identifiers = ["arn:aws:iam::391854517948:user/cloudflare-logpush"]
      type        = "AWS"
    }
  }
}

resource "aws_s3_bucket_policy" "worker_logs" {
  bucket = aws_s3_bucket.worker_logs.bucket
  policy = data.aws_iam_policy_document.bucket_policy_worker_logs.json
}