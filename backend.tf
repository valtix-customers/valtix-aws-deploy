# AWS S3 Bucket used to store Terraform state files
  # bucket:  Name of the S3 bucket
  # workspace_key_prefix: Top level folder name in the S3 bucket
  # workspace: Non-default workspace name will be a sub-folder to workspace_key_prefix
  # key: Name of the file that the state will be stored
  # region: Region where the S3 bucket is located
  # encrypt: Force server side encryption even if the bucket is not specified as such
  # profile: The Terraform Profile to obtain the credentials used to access the S3 bucket
# Resulting folder structure:
  # /<workspace_key_prefix>/<workspace_name>/<key>
terraform {
  backend "s3" {
    bucket               = "sedemo-john-lab-terraform"
    workspace_key_prefix = "valtix-terraform"
    key                  = "deploy.tfstate"
    region               = "us-east-1"
    encrypt              = true
    profile              = "default"
  }
}