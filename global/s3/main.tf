terraform {
  required_version = ">= 1.0.0"

  backend "s3" {
       # Replace this with your bucket name!
      bucket = "foo-bar-remote-state"
      key = "global/s3/terraform.tfstate"
      region= "us-east-2"
      # Replace this with your DynamoDB table name!
      dynamodb_table = "foo-bar-dynamo"
      encrypt        = true
     }


}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}