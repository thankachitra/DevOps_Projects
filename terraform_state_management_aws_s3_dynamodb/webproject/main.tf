terraform{
    required_providers {
      aws={
        source = "hashicorp/aws"
        version = "5.36.0"
      }
    }
    backend "s3" {
        bucket = "3tier-app-bucket"
        key = "terraform.tfstate"
        region = "us-east-2"
        dynamodb_table = "app-tf-state-table"
}
}
provider "aws"{
    region ="us-east-2"
}

resource "aws_instance" "three-tier-app-project" {
  ami           = "ami-05fb0b8c1424f266b"
  instance_type = "t2.micro"

  tags = {
    Name = "3tier-app"
  }
}