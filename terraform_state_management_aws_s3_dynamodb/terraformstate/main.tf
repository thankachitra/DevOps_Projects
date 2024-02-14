terraform{
    required_providers {
      aws={
        source = "hashicorp/aws"
        version = "5.36.0"
      }
    }
}
provider "aws"{
    region ="us-east-2"
}

resource "aws_s3_bucket" "app_bucket" {
    bucket="3tier-app-bucket"
    tags={
        Name="3tier-app"
    }
}
resource "aws_dynamodb_table" "app_db" {
  name             = "app-tf-state-table"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "3tier-app"
  }
}
