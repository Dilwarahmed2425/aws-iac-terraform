resource "aws_s3_bucket" "terraform_state" {
  bucket = "amar-unique-terraform-state-bucket"

  tags = {
    Name = "Terraform State Bucket"
  }
}