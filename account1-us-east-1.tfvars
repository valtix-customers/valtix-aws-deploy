# Valtix Terraform Documentation
# https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# AWS Settings
# aws_account_name:
# Name of the AWS Account with the Region appended. This is used to define the
# Terraform Workspace to deploy Valtix for each Account-Region pair.
# aws_account_region:
# Name of the AWS Region within the AWS Account where Valtix will be deployed
# aws_azs:
# Availability Zones to use to deploy Valtix into
# aws_tgw_id:
# ID of the existing Transit Gateway to use with Valtix and for Spoke VPC protection
aws_account_name   = "account1-us-east-1"
aws_account_region = "us-east-1"
aws_azs = [
  "us-east-1a",
  "us-east-1b"
]
aws_tgw_id = "tgw-015c2fb8cd9c17b8a"

# Valtix Settings
# valtix_api_key_file:
# The Valtix API Key to authorize using the Valtix Terraform Provider
# valtix_aws_account_name:
# The Valtix Account name for the onboarded AWS Account
# valtix_firewall_role_name:
# The name of the Valtix Firewall AWS IAM Role name
valtix_api_key_file       = "valtix_api_key.json"
valtix_aws_account_name   = "account1"
valtix_firewall_role_name = "valtix-firewall-role"

# Valtix Service VPC Settings
# valtix_svpc_name:
# The name to be used when deploying the Valtix Service VPC
# valtix_svpc_cidr:
# The CIDR to be used when deploying the Valtix Service VPC
# valtix_svp_use_nat_gateway
# Whether to deploy a NAT Gateway to use access to the Internet
# Deploys Valtix Gateways into private subnets with no public IP addresses
valtix_svpc_name            = "account1-us-east-1"
valtix_svpc_cidr            = "10.200.0.0/24"
valtix_svpc_use_nat_gateway = true

# Valtix Spoke VPC Settings
# valtix_spoke_vpcs:
# Map block name should be name of the Spoke VPC
# Spoke VPC ID: AWS VPC ID of the Spoke VPC
# Spoke VPC AWS Account Name: Valtix AWS Account name for the Spoke VPC AWS account
# Spoke VPC Subnets: List of subnet IDs to use for attaching the TGW (placement of TGWe)
# NOTE: It is required to share the TGW with all Spoke VPC accounts.  This can be
# done through the AWS Console by creating a TGW resource share and associating
# each Spoke VPC account as a principal.  If this is not done, then the cross-account
# Spoke VPC protection will produce an error with the solution to share the TGW.
valtix_spoke_vpcs = {
  "app1-vpc-us-east-1" = {
    spoke_vpc_id               = "vpc-0c877e9fe79b3c8dd"
    spoke_vpc_csp_account_name = "account1"
    spoke_vpc_subnets = [
      "subnet-0257109cd11961622"
    ]
  },
  "app2-vpc-us-east-1" = {
    spoke_vpc_id               = "vpc-0c551ad3f6da50562"
    spoke_vpc_csp_account_name = "account1"
    spoke_vpc_subnets = [
      "subnet-05772544eef4807c7",
      "subnet-06b3fcc609c1ba0b1",
      "subnet-06290ec94ea09053c"
    ]
  },
  "db-vpc-us-east-1" = {
    spoke_vpc_id               = "vpc-0a3ce84b1395ccbe2"
    spoke_vpc_csp_account_name = "account1"
    spoke_vpc_subnets = [
      "subnet-0b1f7a6590451f089",
      "subnet-093eed11281610043"
    ]
  },
  "mgmt-vpc-us-east-1" = {
    spoke_vpc_id               = "vpc-062f7daf3fc38003d"
    spoke_vpc_csp_account_name = "account1"
    spoke_vpc_subnets = [
      "subnet-0d5db02e85ac9c271"
    ]
  },
  "workspaces" = {
    spoke_vpc_id               = "vpc-008dcd92528239123"
    spoke_vpc_csp_account_name = "account1"
    spoke_vpc_subnets = [
      "subnet-0facf90c0410bc830",
      "subnet-00c703c67e1f4cf20"
    ]
  }
}

# Valtix Ingress Security Policy Rule Set Settings
# valtix_ingress_policy_ruleset_name:
# The name of the Valtix Ingress Policy Rule Set
valtix_ingress_policy_ruleset_name = "ingress-account1-us-east-1"

# Valtix Ingress Gateway Settings
# valtix_ingress_gateway_name:
# Name of the Valtix Ingress Gateway
# valtix_ingress_gateway_version:
# Version of the Valtix Ingress Gateway
# valtix_ingress_gateway_security_type:
# Security type of the Valtix Ingress Gateway
# valtix_ingress_gateway_ssh_key_pair:
# AWS Key Pair Name for the Valtix Gateway instances to use
# valtix_ingress_gateway_autoscale_min:
# Minimum number of Valtix Gateway instances when completely scaled in
# valtix_ingress_gateway_autoscale_max:
# Maximum number of Valtix Gateway instances whn completely scaled out
# valtix_ingress_gateway_status
# State of the Valtix Ingress Gateway
# valtix_ingress_gateway_internal_lb
# Whether to use an internet-facing LB for public Ingress or an internal LB for private Ingress
valtix_ingress_gateway_name          = "ingress-account1-us-east-1"
valtix_ingress_gateway_version       = "22.06-06"
valtix_ingress_gateway_security_type = "INGRESS"
valtix_ingress_gateway_ssh_key_pair  = "valtix-key-gateway"
valtix_ingress_gateway_autoscale_min = "1"
valtix_ingress_gateway_autoscale_max = "1"
valtix_ingress_gateway_status        = "ACTIVE"
valtix_ingress_gateway_internal_lb   = "false"

# Valtix Ingress Security Policy Rule Set Settings
# valtix_egress-ew_policy_ruleset_name:
# The name of the Valtix Egress/EW Policy Rule Set
valtix_egressew_policy_ruleset_name = "egressew-accoun1-us-east-1"

# Valtix Egress/EW Gateway Settings
# valtix_egress-ew_gateway_name:
# Name of the Valtix Egress/EW Gateway
# valtix_egress-ew_gateway_version:
# Version of the Valtix Egress/EW Gateway
# valtix_egress-ew-gateway_security_type:
# Security type of the Valtix Egress/EW Gateway
# valtix_egress-ew-gateway_ssh_key_pair:
# AWS Key Pair Name for the Valtix Egress/EW Gateway instances to use
# valtix_egress-ew_gateway_autoscale_min:
# Minimum number of Valtix Egress/EW Gateway instances when completely scaled in
# valtix_egress-ew_gateway_autoscale_max:
# Maximum number of Valtix Egress/EW Gateway instances whn completely scaled out
# valtix_egress-ew_gateway_status
# State of the Valtix Egress/EW Gateway
valtix_egressew_gateway_name          = "egressew-account1-us-east-1"
valtix_egressew_gateway_version       = "22.06-06"
valtix_egressew_gateway_security_type = "EGRESS"
valtix_egressew_gateway_ssh_key_pair  = "valtix-key-gateway"
valtix_egressew_gateway_autoscale_min = "1"
valtix_egressew_gateway_autoscale_max = "1"
valtix_egressew_gateway_status        = "ACTIVE"