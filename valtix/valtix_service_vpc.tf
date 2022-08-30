# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# Create a new dual-stack Valtix Services VPC to host Valtix Ingress and Egress/EW Gateway Stacks
resource "valtix_service_vpc" "service_vpc" {
  name               = var.valtix_svpc_name
  csp_account_name   = var.valtix_aws_account_name
  region             = var.aws_account_region
  cidr               = var.valtix_svpc_cidr
  availability_zones = var.aws_azs
  transit_gateway_id = var.aws_tgw_id
  use_nat_gateway    = var.valtix_svpc_use_nat_gateway
}