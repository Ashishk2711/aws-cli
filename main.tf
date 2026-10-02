terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "ap-south-1"
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get a default subnet
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Create EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t3.micro"

  subnet_id = data.aws_subnets.default.ids[0]

  tags = {
    Name        = "Terraform-EC2"
    Environment = "Practice"
  }
}