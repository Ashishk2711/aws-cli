terraform {
  backend "s3" {
    bucket         = "aws-application-987"
    key            = "github-actions/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "my-tf-lock-table"
    encrypt        = true
  }
}