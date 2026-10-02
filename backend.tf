terraform {
  backend "s3" {
    bucket         = "my-tf-state-bucket-123"
    key            = "github-actions/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "my-tf-lock-table"
    encrypt        = true
  }
}