# Deploy Valtix for Ingress and Egress / EW Protection

# Authorization
1. Enable Terraform to access your AWS Account. Check here for the options https://registry.terraform.io/providers/hashicorp/aws/latest/docs
1. Login to the Valtix Dashboard and generate an API Key using the instructions provided here: https://registry.terraform.io/providers/valtix-security/valtix/latest/docs

# Configuration
1. Download and install the Terraform binary/executable provided here: https://www.terraform.io/downloads.  Be sure to add the binary/executable to your path.
1. Configure the AWS credentials for Terraform access from the  "Shared Configuration and Credentials Files" section found here: https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration
  1. Create the ~/.aws/config file
  1. Create a Profile for each AWS Account name with the AWS Account Region appended
  1. Store the `aws_access_key_id` and `aws_access_key_secret` for each AWS Account in its corresponding Profile

# Variables
The set of variables for each Profile is defined in a separate file.  The name of the file will be the AWS Account name with the AWS Region name appended, with a .tfvars extension.  Each Profile is referenced in the shell (.sh) file, which is used to run the Terraform.

# Valtix API Key File
In order to authenticate with the Valtix Terraform Provider, a Valtix API Key file is used.  This is generated from within Valtix and requires admin_super permissions to create.  The API Key File must be generated with admin_rw permissions and is used to authenticate Terraform calls to the Valtix Terraform Provider.  The JSON file needs to be placed in the top-level folder for this repository.  It is referenced by name by the `valtix_api_key_file` variable in the TFVars file

# Execution
The Terraform will be run using a shell (.sh) file called `accounts.sh`.  This file will reference the one or more Profiles, which will call the Terraform for each Profile named .tfvars file.  Arguments can be applied in the same way arguments are applied when running Terraform without the shell file.

The Shell file will create a set of Terraform Workspaces (one per Profile), and use each Workspace to perform operations on each AWS Account and Region accordingly.  The Terraform state for each Profile will be stored in the Terraform Workspace.

In order to run Terraform on a single, subset or all Profiles, each Profile can be commented or uncommented in the shell (.sh) file accordingly.  This will not alter the Terraform State, but purely dictate what Profiles will be operated on when the shell file is executed.

# AWS Transit Gateway
In order for Terraform to orchestrate cross-Account (inter-Account) Spoke VPC protection, the Transit Gateway must be shared across all AWS Accounts containing Spoke VPCs.  Check here for specific directions from AWS Documentation:  https://docs.aws.amazon.com/vpc/latest/tgw/tgw-transit-gateways.html#tgw-sharing