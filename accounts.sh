#!/bin/zsh
# Syntax:
  # Terraform Plan: ./sedemo-valtix.sh plan
  # Terraform Apply: ./sedemo-valtix.sh apply
  # Terraform Destroy: ./sedemo-valtix.sh destroy

# Initialize Terraform
terraform init

# Specify the list of Terraform Workspace (Profile - AWS Account) names
workspace_names=(
account1-eu-west-1
)

# Check for action and set to plan if not specified
action=$1
if [ "$action" = "" ]; then
  action="plan"
fi

# Loop over each Terraform Workspace and perform action
for x in ${workspace_names[@]}; do
  terraform workspace new $x
  terraform workspace select $x
  terraform $action -var-file $x.tfvars $2
done

# Set the Terraform Workspace back to default
terraform workspace select default