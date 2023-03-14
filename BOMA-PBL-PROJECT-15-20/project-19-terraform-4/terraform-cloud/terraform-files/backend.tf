# In project 18, we used AWS S3 as our backend,
# but in project19 we will use TERRAFORM CLOUD
# terraform {
#   backend "remote" {
#     organization = "Smile-Nigeria"

#     workspaces {
#       name = "PROJECT19-TERRAFORM-CLOUD"
#     }
#   }
# }




resource "aws_s3_bucket" "terraform_state" {
  bucket = "osasboma-dev-terraform-bucket"
}

resource "aws_s3_bucket_versioning" "s3_version" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
# Enable server-side encryption by default
# server_side_encryption_configuration {
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }
#}

#Dynamo DB resource for locking and consistency checking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

# Configuring s3 bucket
terraform {
  backend "s3" {
    bucket         = "osasboma-dev-terraform-bucket"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# Note: The bucket name may not work for you since buckets are unique globally in AWS, so you must give it a unique name.
#NOTE: Some of the code used have deprecated so, have to create mine.locals {


# Enable versioning so we can see the full revision history of our state files
# versioning {
#   enabled = true

#}
#}

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
# }
# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "boma-dev-terraform-bucket"
# }

# resource "aws_s3_bucket_versioning" "s3_version" {
#   bucket = aws_s3_bucket.terraform_state.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

# resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
#   bucket = aws_s3_bucket.terraform_state.bucket

#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }
# Enable server-side encryption by default
# server_side_encryption_configuration {
#   rule {
#     apply_server_side_encryption_by_default {
#       sse_algorithm = "AES256"
#     }
#   }
# }
#}

#Dynamo DB resource for locking and consistency checking
# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "terraform-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

# # Configuring s3 bucket
# terraform {
#   backend "s3" {
#     bucket         = "boma-dev-terraform-bucket"
#     key            = "global/s3/terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }