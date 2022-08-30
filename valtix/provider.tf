# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# Specify the Valtix Terraform Provider
# Specify the AWS Terraform Provider
  # This is needed only for representing the subnets in a Spoke VPC TGW attachment
  # This will not be needed once Valtix supports this natively
terraform {
  required_providers {
     valtix = {
      source  = "valtix-security/valtix"
    }
  }
}