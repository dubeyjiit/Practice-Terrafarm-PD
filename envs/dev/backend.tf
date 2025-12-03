# Uncomment and fill values to enable remote S3 backend + DynamoDB locking
# terraform {
#   backend "s3" {
#     bucket         = "my-terraform-state-bucket"
#     key            = "envs/dev/terraform.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }