# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# AWS Account Name
variable "aws_account_name" {
  type = string
}

# AWS Account Region
variable "aws_account_region" {
  type = string
}

# AWS Availability Zones
variable "aws_azs" {
  type = list(string)
}

# AWS TGW ID
variable "aws_tgw_id" {
  type = string
}

# Valtix AWS Account Name
variable "valtix_aws_account_name" {
  type = string
}

# Valtix Service VPC Name
variable "valtix_svpc_name" {
  type = string
}

# Valtix Service VPC CIDR
variable "valtix_svpc_cidr" {
  type = string
}

# Valtix Service NAT Gateway
variable "valtix_svpc_use_nat_gateway" {
  type = bool
}

# Valtix Spoke VPCs
variable "valtix_spoke_vpcs" {
}

# Valtix Ingress Policy Rule Set Name
variable "valtix_ingress_policy_ruleset_name" {
  type = string
}

# Valtix Ingress Gateway Name
variable "valtix_ingress_gateway_name" {
  type = string
}

# Valtix Ingress Gateway Version
variable "valtix_ingress_gateway_version" {
  type = string
}

# Valtix Ingress Gateway Security Type
variable "valtix_ingress_gateway_security_type" {
  type = string
}

# Valtix Ingress Gateway SSH Key Pair
variable "valtix_ingress_gateway_ssh_key_pair" {
  type = string
}

# Valtix Ingress Gateway Autoscale Min
variable "valtix_ingress_gateway_autoscale_min" {
  type = string
}

# Valtix Ingress Gateway Autoscale Max
variable "valtix_ingress_gateway_autoscale_max" {
  type = string
}

# Valtix Ingress Gateway Status
variable "valtix_ingress_gateway_status" {
  type = string
}

# Valtix Ingress Gateway Internal LB
variable "valtix_ingress_gateway_internal_lb" {
  type = string
}

# Valtix Egress/EW Policy Rule Set Name
variable "valtix_egressew_policy_ruleset_name" {
  type = string
}

# Valtix Egress/EW Gateway Name
variable "valtix_egressew_gateway_name" {
  type = string
}

# Valtix Egress/EW Gateway Version
variable "valtix_egressew_gateway_version" {
  type = string
}

# Valtix Egress/EW Gateway Security Type
variable "valtix_egressew_gateway_security_type" {
  type = string
}

# Valtix Egress/EW Gateway SSH Key Pair
variable "valtix_egressew_gateway_ssh_key_pair" {
  type = string
}

# Valtix Egress/EW Gateway Autoscale Min
variable "valtix_egressew_gateway_autoscale_min" {
  type = string
}

# Valtix Egress/EW Gateway Autoscale Max
variable "valtix_egressew_gateway_autoscale_max" {
  type = string
}

# Valtix Egress/EW Gateway Status
variable "valtix_egressew_gateway_status" {
  type = string
}

# Valtix Firewall Role Name
variable "valtix_firewall_role_name" {
  type = string
}