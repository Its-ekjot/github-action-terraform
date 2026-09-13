resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.bucket_name}-${random_id.rand.hex}"
}

resource "random_id" "rand" {
  byte_length = 4
}

