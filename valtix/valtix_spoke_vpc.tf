# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# Establish Valtix Spoke VPC Protections
  # This operation is disruptive for any Spoke VPCs that are already attached
  # to the TGW and have their default route pointing to the current Service VPCs.
  # This operation should be done as a separate run after the new Service VPC
  # and Gateways have been deployed.  The resource can be commented out to not
  # execute and then uncommented to execute.
resource "valtix_spoke_vpc" "spoke_vpcs" {
  for_each                           = var.valtix_spoke_vpcs
  service_vpc_id                     = valtix_service_vpc.service_vpc.id
  spoke_vpc_id                       = each.value.spoke_vpc_id
  spoke_vpc_csp_account_name         = each.value.spoke_vpc_csp_account_name
  spoke_vpc_region                   = var.aws_account_region
  transit_gateway_attachment_subnets = each.value.spoke_vpc_subnets
}