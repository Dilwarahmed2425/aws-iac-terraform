terraform {
  backend "s3" {
    bucket       = "amar-unique-terraform-state-bucket"
    key          = "terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}