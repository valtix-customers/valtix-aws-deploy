# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# Workspace Check
# This is a method for ensuring that the Workspace selected and the account used in the TFVars file is a match
# This is an important check to ensure that the correct TFVars are being applied.  If ther is a mismatch, then
# the Terraform will throw an error as shown below.
data "local_file" "workspace_check" {
  count    = var.aws_account_name == terraform.workspace ? 0 : 1
  filename = "ERROR: Terraform Workspace does not match the name provided: terraform workspace create <workspacename>"
}

# Valtix Service VPC, Spoke VPCs Protection, Policy Rule Sets, and Gateways
# This is the module used to deploy Valtix - Service VPC, Spoke VPC Protection, Policy Rule Set and Gateways
module "valtix" {
  aws_account_name                      = var.aws_account_name
  aws_account_region                    = var.aws_account_region
  aws_azs                               = var.aws_azs
  aws_tgw_id                            = var.aws_tgw_id
  valtix_aws_account_name               = var.valtix_aws_account_name
  valtix_svpc_name                      = var.valtix_svpc_name
  valtix_svpc_cidr                      = var.valtix_svpc_cidr
  valtix_svpc_use_nat_gateway           = var.valtix_svpc_use_nat_gateway
  valtix_spoke_vpcs                     = var.valtix_spoke_vpcs
  valtix_ingress_policy_ruleset_name    = var.valtix_ingress_policy_ruleset_name
  valtix_ingress_gateway_name           = var.valtix_ingress_gateway_name
  valtix_ingress_gateway_version        = var.valtix_ingress_gateway_version
  valtix_ingress_gateway_security_type  = var.valtix_ingress_gateway_security_type
  valtix_ingress_gateway_ssh_key_pair   = var.valtix_ingress_gateway_ssh_key_pair
  valtix_ingress_gateway_autoscale_min  = var.valtix_ingress_gateway_autoscale_min
  valtix_ingress_gateway_autoscale_max  = var.valtix_ingress_gateway_autoscale_max
  valtix_ingress_gateway_status         = var.valtix_ingress_gateway_status
  valtix_ingress_gateway_internal_lb    = var.valtix_ingress_gateway_internal_lb
  valtix_egressew_policy_ruleset_name   = var.valtix_egressew_policy_ruleset_name
  valtix_egressew_gateway_name          = var.valtix_egressew_gateway_name
  valtix_egressew_gateway_version       = var.valtix_egressew_gateway_version
  valtix_egressew_gateway_security_type = var.valtix_egressew_gateway_security_type
  valtix_egressew_gateway_ssh_key_pair  = var.valtix_egressew_gateway_ssh_key_pair
  valtix_egressew_gateway_autoscale_min = var.valtix_egressew_gateway_autoscale_min
  valtix_egressew_gateway_autoscale_max = var.valtix_egressew_gateway_autoscale_max
  valtix_egressew_gateway_status        = var.valtix_egressew_gateway_status
  valtix_firewall_role_name             = var.valtix_firewall_role_name
  source                                = "./valtix"
}