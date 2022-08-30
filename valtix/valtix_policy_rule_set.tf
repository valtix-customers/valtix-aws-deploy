# Valtix Terraform Documentation
  # https://registry.terraform.io/providers/valtix-security/valtix/latest/docs
# AWS Terraform Documentation
  # https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# Create a the Valtix Ingress Policy Rule Set
resource "valtix_policy_rule_set" "ingress_policy" {
  name = var.valtix_ingress_policy_ruleset_name
}

# Obtain the Valtix Ingress Policy Rule Set
data "valtix_policy_rule_set" "ingress_policy" {
  name = var.valtix_ingress_policy_ruleset_name
}

# Create the Valtix Egress/EW Policy Rule Set
resource "valtix_policy_rule_set" "egressew_policy" {
  name = var.valtix_egressew_policy_ruleset_name
}

# Obtain the Valtix Egress/EW Policy Rule Set
data "valtix_policy_rule_set" "egressew_policy" {
  name = var.valtix_egressew_policy_ruleset_name
}