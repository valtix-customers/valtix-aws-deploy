# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# Create a new Valtix Ingress Gateway Stack
# If the desire is to destroy the Gateway Stack, comment out the resource block
# If the desire is to create the Gateway Stack, uncomment out the resource block
resource "valtix_gateway" "ingress_gateway" {
  name                  = var.valtix_ingress_gateway_name
  csp_account_name      = var.valtix_aws_account_name
  instance_type         = "AWS_M5_2XLARGE"
  gateway_image         = var.valtix_ingress_gateway_version
  mode                  = "HUB"
  security_type         = var.valtix_ingress_gateway_security_type
  policy_rule_set_id    = data.valtix_policy_rule_set.ingress_policy.rule_set_id
  ssh_key_pair          = var.valtix_ingress_gateway_ssh_key_pair
  aws_iam_role_firewall = var.valtix_firewall_role_name
  region                = var.aws_account_region
  vpc_id                = valtix_service_vpc.service_vpc.id
  min_instances         = var.valtix_ingress_gateway_autoscale_min
  max_instances         = var.valtix_ingress_gateway_autoscale_max
  gateway_state         = var.valtix_ingress_gateway_status
  # settings {
  #   name  = "controller.use_internal_lb"
  #   value = var.valtix_ingress_gateway_internal_lb
  # }
}

# Create a new Valtix Egress/EW Gateway Stack
# If the desire is to destroy the Gateway Stack, comment out the resource block
# If the desire is to create the Gateway Stack, uncomment out the resource block
resource "valtix_gateway" "egressew_gateway" {
  name                  = var.valtix_egressew_gateway_name
  csp_account_name      = var.valtix_aws_account_name
  instance_type         = "AWS_M5_2XLARGE"
  gateway_image         = var.valtix_egressew_gateway_version
  mode                  = "EDGE"
  security_type         = var.valtix_egressew_gateway_security_type
  policy_rule_set_id    = data.valtix_policy_rule_set.egressew_policy.rule_set_id
  ssh_key_pair          = var.valtix_egressew_gateway_ssh_key_pair
  aws_iam_role_firewall = var.valtix_firewall_role_name
  region                = var.aws_account_region
  vpc_id                = valtix_service_vpc.service_vpc.id
  min_instances         = var.valtix_egressew_gateway_autoscale_min
  max_instances         = var.valtix_egressew_gateway_autoscale_max
  gateway_state         = var.valtix_egressew_gateway_status
  aws_gateway_lb        = true
}