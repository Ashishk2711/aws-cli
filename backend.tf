terraform {
  backend "s3" {
    bucket       = "aws-application-985"
    key          = "practice/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}