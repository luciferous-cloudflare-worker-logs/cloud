locals {
  ssm = {
    prefix = {
      output = "/Outputs"
    }
  }
}

# ================================================================
# Outputs
# ================================================================

resource "aws_ssm_parameter" "bucket_name_worker_logs" {
  name  = "${local.ssm.prefix.output}/BucketNameWorkerLogs"
  type  = "String"
  value = aws_s3_bucket.worker_logs.bucket
}