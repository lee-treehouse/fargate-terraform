terraform {
  required_version = ">= 1.0.0"

# 210ae1d2aa99:/terraform# terraform init

# Initializing the backend...
# Do you want to copy existing state to the new backend?
#   Pre-existing state was found while migrating the previous "local" backend to the
#   newly configured "s3" backend. No existing state was found in the newly
#   configured "s3" backend. Do you want to copy this state to the new "s3"
#   backend? Enter "yes" to copy and "no" to start with an empty state.


  backend "s3" {
       # Replace this with your bucket name!
      bucket = "foo-bar-remote-state"
      key = "terraform.tfstate"
      region= "us-east-2"
      # Replace this with your DynamoDB table name!
      dynamodb_table = "foo-bar-dynamo"
      encrypt        = true
     }


}


# resource "aws_s3_bucket" "terraform_state" {

#   bucket = var.remote_state_bucket_name
#   force_destroy = true
# }

# resource "aws_s3_bucket_versioning" "versioning_example" {
#   bucket = aws_s3_bucket.terraform_state.id
#   versioning_configuration {
#     status = "Enabled"
#   }

# }

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.remote_state_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}